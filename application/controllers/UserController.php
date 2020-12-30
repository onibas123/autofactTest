<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UserController extends CI_Controller {

    function __construct()
	{
		parent::__construct();
        $this->load->model('UsersModel', 'user_model');
        $this->load->model('SessionsModel', 'session_model');
        $this->load->model('LogsModel', 'log_model');
	}

	public function index()
	{
		$this->load->view('login');
    }
    
    public function login()
    {
        $date_time_now = date('Y-m-d H:i:s');

        $email = trim($this->input->post('input-email', TRUE));
        $password = sha1(trim($this->input->post('input-password', TRUE)));

        $user = $this->user_model->login($email, $password);
        if(!empty($user))
        {
            //user exist
            $token = $this->generateToken();
            //in the web side doesn´t expire, it´s value is for API side.
            //the session is controlled by logout method
            $exp = $this->add_mins_datetime(10, $date_time_now);

            $session_array = array(
                'user_id' => $user[0]['id'],
                'name' => $user[0]['name'],
                'email' => $user[0]['email'],
                'password' => $user[0]['password'],
                'roles_id' => $user[0]['roles_id'],
                'rol' => $user[0]['rol']
            );

            $session_data = array(
                'users_id' => $user[0]['id'],
                'access_way' => 'WEB',
                'token' => $token,
                'created' => $date_time_now,
                'exp' => $exp
            );


            //SESSION START
            $this->session->set_userdata($session_array);
            if($this->session_model->add($session_data))
            {
                header('Location: '.base_url().'index.php/Welcome/home');
            }
            
        }
        else
        {
            //email or password wrong
            $data = array(
                'description' => 'email or password wrong',
                'logs_type_id' => 2, //error envio formulario
                'created' => $date_time_now
            );

            if($this->log_model->add($data))
            {
                $data = array(
                    'message' => '<center><h5><font color="red">Email y/o Password incorrecto.</font></h5></center>'
                );
    
                $this->load->view('login', $data);
            }
        }
    }

    public function logout()
	{
		$this->session->userdata = array();
		$this->session->sess_destroy();
		header('Location: '.base_url());
    }
    
    private function generateToken()
    {
      $token = bin2hex(openssl_random_pseudo_bytes(32));
      return $token;
    }

    private function add_mins_datetime($minutes_to_add, $datetime)
    {
      $time = new DateTime($datetime);
      $time->add(new DateInterval('PT' . $minutes_to_add . 'M'));

      $stamp = $time->format('Y-m-d H:i:s');
      return $stamp;
    }
}
?>

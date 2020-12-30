<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FormsController extends CI_Controller {

    function __construct()
	{
		parent::__construct();
        $this->load->model('FormsModel', 'form_model');
    }
    
    public function addAnswers()
    {
        $date_time_now = date('Y-m-d H:i:s');

        $a_1 = trim($this->input->post('a_1', TRUE));
        $a_2 = trim($this->input->post('a_2', TRUE));
        $a_3 = trim($this->input->post('a_3', TRUE));
        $user_id = $this->session->userdata('user_id');

        $data_a1 = array(
            'question_number' => 1,
            'answer' => $a_1,
            'forms_questions_id' => 1,
            'users_id' => $user_id,
            'created' => $date_time_now
        );

        $this->form_model->add_answer($data_a1);

        $data_a2 = array(
            'question_number' => 2,
            'answer' => $a_2,
            'forms_questions_id' => 1,
            'users_id' => $user_id,
            'created' => $date_time_now
        );

        $this->form_model->add_answer($data_a2);

        $data_a3 = array(
            'question_number' => 3,
            'answer' => $a_3,
            'forms_questions_id' => 1,
            'users_id' => $user_id,
            'created' => $date_time_now
        );

        $this->form_model->add_answer($data_a3);

        echo '1';
    }

    public function getAllAnswers()
    {
        $answers = $this->form_model->getAllAnswers();
        echo json_encode($answers);
    }

    public function getAnswers_User()
    {
        $answer = $this->form_model->getAnswers_User();
        echo json_encode($answer);
    }

    public function count_answers()
    {
        $count_answer_si = $this->form_model->count_answer("SI");
        $count_answer_no = $this->form_model->count_answer("NO");
        $count_answer_mas = $this->form_model->count_answer("Más o Menos");

        $data = array(
            'SI' => $count_answer_si,
            'NO' => $count_answer_no,
            'MAS' => $count_answer_mas
        );
        echo json_encode($data);
    }

}
?>

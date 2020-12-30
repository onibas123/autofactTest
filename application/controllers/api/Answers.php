<?php
   
require APPPATH . 'libraries/REST_Controller.php';
     
class Answers extends REST_Controller {
    
	  /**
     * Get All Data from this method.
     *
     * @return Response
    */
    public function __construct() {
       parent::__construct();
       $this->load->database();
    }
       
    /**
     * Get All Data from this method.
     *
     * @return Response
    */
	public function index_get($id = 0)
	{
        $id = trim($this->input->get('id', TRUE));
        
        if(!empty($id)){
            $data = $this->db->get_where("answers", ['id' => $id])->row_array();
        }else{
            $data = $this->db->get("answers")->result();
        }
     
        $this->response($data, REST_Controller::HTTP_OK);
	}
    	
}
?>
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	function __construct()
	{
		parent::__construct();
        $this->load->model('FormsModel', 'forms_model');
	}

	public function index()
	{
		$this->load->view('login');
	}

	public function home()
	{
		//get only one form in db & questions
		$form = $this->forms_model->getForm();
		$forms_questions = $this->forms_model->getForm_Questions($form[0]['id']);

		$data = array(
			'form' => $form,
			'form_questions' => $forms_questions 
		);

		$this->load->view('home', $data);
	}
}
?>
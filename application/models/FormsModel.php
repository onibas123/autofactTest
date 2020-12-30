<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class FormsModel extends CI_Model {

    function __construct()
	{
		parent::__construct();
    }
    
    public function getForm()
    {
        $this->db->select('forms.id as id, forms.form as form, forms.description as description, DATE_FORMAT(forms.created, "%d-%m-%Y %H:%i:%s") as created');
        $this->db->from('forms');
        $this->db->limit(1);

        return $this->db->get()->result_array();
    }

    public function getForm_Questions($form_id)
    {
        $this->db->select('forms_questions.id as id, forms_questions.number as number, forms_questions.question as question, forms_questions.forms_id as forms_id');
        $this->db->from('forms_questions');
        $this->db->where('forms_questions.forms_id', $form_id);
        $this->db->order_by('forms_questions.number', 'asc');

        return $this->db->get()->result_array();
    }

    public function add_answer($data)
    {
        if($this->db->insert('answers', $data))
            return true;
        else
            return false;
    }

    public function getAllAnswers()
    {
        $this->db->select('answers.question_number as number, answers.answer as answer, DATE_FORMAT(answers.created, "%d-%m-%Y %H:%i:%s") as created, users.name as name, forms_questions.question as question');
        $this->db->from('answers');
        $this->db->join('users','users.id = answers.users_id');
        $this->db->join('forms_questions','forms_questions.id = answers.forms_questions_id');
        $this->db->order_by('answers.id');

        return $this->db->get()->result_array();
    }

    public function getAnswers_User()
    {
        $this->db->select('answers.question_number as number, answers.answer as answer, DATE_FORMAT(answers.created, "%d-%m-%Y %H:%i:%s") as created, users.name as name, forms_questions.question as question');
        $this->db->from('answers');
        $this->db->join('users','users.id = answers.users_id');
        $this->db->join('forms_questions','forms_questions.id = answers.forms_questions_id');
        $this->db->where('users.id', $this->session->userdata('user_id'));

        return $this->db->get()->result_array();
    }

    public function count_answer($answer)
    {
        $this->db->select('COUNT(answers.answer) as count_answer, forms_questions.question as question');
        $this->db->from('answers');
        $this->db->join('forms_questions','forms_questions.id = answers.forms_questions_id');
        $this->db->where('answers.answer', $answer);
        $this->db->where('answers.question_number', 2);
        $this->db->group_by('forms_questions.id');
        $this->db->group_by('forms_questions.id');

        return $this->db->get()->result_array();

    }
}
?>

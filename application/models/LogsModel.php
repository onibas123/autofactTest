<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LogsModel extends CI_Model {

    function __construct()
	{
		parent::__construct();
    }
    
    public function add($data)
    {
        if($this->db->insert('logs', $data))
            return true;
        else
            return false;
    }
}
?>
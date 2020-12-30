<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class UsersModel extends CI_Model {

    function __construct()
	{
		parent::__construct();
    }
    
    public function login($email, $password)
    {
        $this->db->select('users.id as id, users.name as name, users.email as email, users.password as password, users.roles_id as roles_id, roles.rol as rol');
        $this->db->from('users');
        $this->db->join('roles', 'roles.id = users.roles_id');
        $this->db->where('email', $email);
        $this->db->where('password', $password);
        $this->db->limit(1);

        return $this->db->get()->result_array();
    }
}
?>

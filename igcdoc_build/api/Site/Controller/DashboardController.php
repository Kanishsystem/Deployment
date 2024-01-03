<?php 

namespace Site\Controller;

use Core\BaseController;

// site helpers
use Site\Helpers\NetworkHelper;
use Site\Helpers\UserHelper;
use Site\Helpers\DocumentHelper;
use Site\Helpers\ElectricalHelper;
use Site\Helpers\MeetRoomHelper;
use Site\Helpers\TelephoneHelper;
use Site\Helpers\MechanicalHelper;
use Site\Helpers\DocTypeHelper;


//DashboardController

class DashboardController extends BaseController{

    private UserHelper $_user_helper;
    private DocumentHelper $_doc_helper;
    private ElectricalHelper $_electrical_helper;
    private MeetRoomHelper $_meetroom_helper;
    private TelephoneHelper $_telephone_helper;
    private NetworkHelper $_network_helper;
    private MechanicalHelper $_mechanical_helper;
    private DocTypeHelper $_doc_type_helper;


    function __construct($params)
    {
        parent::__construct($params);
        // 
        $this->_user_helper = new UserHelper($this->db);
        $this->_doc_helper = new DocumentHelper($this->db);
        $this->_electrical_helper = new ElectricalHelper($this->db);
        $this->_meetroom_helper = new MeetRoomHelper($this->db);
        $this->_telephone_helper = new TelephoneHelper($this->db);
        $this->_network_helper = new NetworkHelper($this->db);
        $this->_mechanical_helper = new MechanicalHelper($this->db);
        $this->_doc_type_helper = new DocTypeHelper($this->db);
        //$this->_user_role_helper = new UserRoleHelper($this->db);
    }
    /**
     * 
     */
    public function getCounts(){        
        $db = new \stdClass();
        $db->user = $this->_user_helper->getLoginCount($this->params["type"]);
        $db->docs =  $this->_doc_helper->getCount($this->params["type"]);
        $db->electrical = $this->_electrical_helper->getCount($this->params["type"]);
        $db->meetcount = $this->_meetroom_helper->getCount($this->params["type"]);
        $db->telephone = $this->_telephone_helper->getCount($this->params["type"]);
        $db->network = $this->_network_helper->getCount($this->params["type"]);
        $db->mechanical = $this->_mechanical_helper->getCount($this->params["type"]);
        $db->docsByStatus =  $this->_doc_helper->getCountByStatus();
        $db->electricalByStatus = $this->_electrical_helper->getCountByStatus();
        $db->meetcountByStatus = $this->_meetroom_helper->getCountByStatus();
        $db->telephoneByStatus = $this->_telephone_helper->getCountByStatus();
        $db->networkByStatus = $this->_network_helper->getCountByStatus();
        $db->mechanicalByStatus = $this->_mechanical_helper->getCountByStatus();
        $this->response($db);
    }

    private function getTypeChart($year){
        $sql = "show_chart=1";
        $data =  $this->_doc_type_helper->getAllData($sql);
        $label_data = [];
      //  var_dump($data);
        foreach($data as $obj){
            $db = new \stdClass();
            $db->label = $obj->doc_type;
            $db->data = $this->_doc_helper->getTypeCount($year,$obj->ID);
            $label_data[] = $db;
        }
        return $label_data;
    }
   /**
     * 
     */
    public function getCountsByYear(){        
        $db = new \stdClass();
        $db->docs =  $this->_doc_helper->getCountByYear($this->params["year"]);
        $db->electrical = $this->_electrical_helper->getCountByYear($this->params["year"]);
        $db->meetcount = $this->_meetroom_helper->getCountByYear($this->params["year"]);
        $db->telephone = $this->_telephone_helper->getCountByYear($this->params["year"]);
        $db->network = $this->_network_helper->getCountByYear($this->params["year"]);
        $db->mechanical = $this->_mechanical_helper->getCountByYear($this->params["year"]);

        $db->reportCount = $this->_doc_helper->reportCount($this->params["year"]);
        $db->journalCount = $this->_doc_helper->journalCount($this->params["year"]);
        $db->conferenceCount = $this->_doc_helper->conferenceCount($this->params["year"]);
        
        $db->type_data = $this->getTypeChart($this->params["year"]);


        $this->response($db);
    }
   
}
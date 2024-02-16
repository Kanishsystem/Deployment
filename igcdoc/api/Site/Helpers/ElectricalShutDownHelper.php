<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace Site\Helpers;

use Core\BaseHelper;
use Core\Helpers\SmartConst;
use Core\Helpers\SmartGeneral;

//
use Site\Helpers\TableHelper as Table;

/**
 * Description of Data
 * 
 *  class helps to get the data from post with specified type 
 *
 * @author kms
 */
class ElectricalShutDownHelper extends BaseHelper
{

    const schema = [
        "from_date" => SmartConst::SCHEMA_DATE,
        "to_date" => SmartConst::SCHEMA_DATE,
        "from_time" => SmartConst::SCHEMA_CTIME,
        "to_time" => SmartConst::SCHEMA_CTIME,
        "description" => SmartConst::SCHEMA_TEXT,
        "location" => SmartConst::SCHEMA_TEXT,
        "sd_mt_userdb_id" => SmartConst::SCHEMA_CUSER_ID,
        "admin_id" => SmartConst::SCHEMA_INTEGER,
        "admin_time" => SmartConst::SCHEMA_CDATETIME,
        "admin_remarks" => SmartConst::SCHEMA_VARCHAR,
        "status" => SmartConst::SCHEMA_INTEGER,
        "created_time" => SmartConst::SCHEMA_CDATETIME,
        "last_modified_by" => SmartConst::SCHEMA_CUSER_ID,
        "last_modified_remarks" => SmartConst::SCHEMA_TEXT,
        "last_modified_time" => SmartConst::SCHEMA_CTIME

    ];
    /**
     * 
     */
    const validations = [
        "from_date" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Electrical Shutdown Start Date"
            ]
            ],
          "to_date" => [
              [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Electrical Shutdown End Date"
            ]
        ],
        "from_time" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Electrical Shutdown Start Time"
            ]
            ],
          "to_time" => [
              [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Electrical Shutdown End Time"
            ]
        ],
        "uploaded_file" => [
            [
                "type" => SmartConst::VALID_FILE_REQUIRED,
                "msg" => "Please Upload the Document"
            ],
            [
                "type" => SmartConst::VALID_FILE_TYPE,
                "msg" => "Only pdf is allowed",
                "ext"=>["pdf"]
            ]
        ],
        "description" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Description"
            ]
        ],
        "admin_id" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Select Approver"
            ]
        ],
        "admin_remarks" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter Remarks"
            ]
        ],
        "status" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter status"
            ]
        ],

        "last_modified_remarks" => [
            [
                "type" => SmartConst::VALID_REQUIRED,
                "msg" => "Please Enter remarks"
            ]
        ]


    ];
       // file handling 
   const FILE_FOLDER = "ElectricalShutDown";
   const FILE_NAME = "file";
    //
    public function getFullFile($id){
        return self::FILE_FOLDER . DS . $id . DS . self::FILE_NAME;
    }
    /**
     * 
     */
    /**
     * 
     */
    public function insert(array $columns, array $data)
    {
        return $this->insertDb(self::schema, Table::ELECTRICAL_SHUTDOWN, $columns, $data);
    }
    /**
     * 
     */
    public function update(array $columns, array $data, int $id)
    {
        return $this->updateDb(self::schema, Table::ELECTRICAL_SHUTDOWN, $columns, $data, $id);
    }
    /**
     * 
     */
    public function getAllData($sql = "", $data_in = [], $group_by = "", $count = false)
    {
        $from = Table::ELECTRICAL_SHUTDOWN. " t1 
        INNER JOIN " . Table::USERS . " t2 ON t1.sd_mt_userdb_id = t2.ID";
        $select = ["t1.*,t2.ename as created_by"];
        $order_by = "t1.created_time DESC";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], $count);
    }
    /**
     * 
     */
    public function getOneData($id)
    {
        $from = Table::ELECTRICAL_SHUTDOWN . " t1 
        INNER JOIN " . Table::USERS . " t2 ON t1.sd_mt_userdb_id = t2.ID 
        ";
        $select = ["t1.*,t2.ename as created_by"];
        $sql = "t1.ID=:ID";
        $data_in = ["ID" => $id];
        $group_by = "";
        $order_by = "";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
    }
    /**
     * 
     */
    public function getElecShutDownWithUserID($id)
    {
        $from = Table::ELECTRICAL_SHUTDOWN;
        $select = ["*"];
        $sql = "sd_mt_userdb_id=:ID";
        $data_in = ["ID" => $id];
        $group_by = "";
        $order_by = "";
        return $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, true, []);
    }
    /**
     * 
     */
    public function deleteOneId($id)
    {
        $from = Table::ELECTRICAL_SHUTDOWN;
        $this->deleteId($from, $id);
    }

    public function getCount($type)
    {
        $sql = "DATE(t1.created_time)=CURRENT_DATE()";
        if ($type == 1) {
            $sql = "MONTH(t1.created_time)=" . SmartGeneral::getMonth();
        } else if ($type == 2) {
            $sql = "YEAR(t1.created_time)=" . SmartGeneral::getYear();
        }
        $data =  $this->getAllData($sql, [], "", true);
        return isset($data) ? count($data) : 0;
    }


    public function getCountByYear($year)
    {
        $select = ["COUNT(description) AS elec_shutdown, MONTH(last_modified_time) AS month"];
        $from = Table::ELECTRICAL_SHUTDOWN;
        $sql = "YEAR(last_modified_time) =:year";
        $group_by = "GROUP BY MONTH(last_modified_time)";
        $order_by = "month";
        $data_in = ["year" => $year];
        $count = $this->getAll($select, $from, $sql, $group_by, $order_by, $data_in, false, [], false);
        $elec_shutdown_count = array_fill(0, 12, 0);
        foreach ($count as $elec_shut) {
            $month = intval($elec_shut->month);
            $elecShutCount = intval($elec_shut->elec_shutdown);
            $elec_shutdown_count[$month - 1] = $elecShutCount;
        }
        $elec_shut_count_by_year = array_values($elec_shutdown_count);
        return $elec_shut_count_by_year;
    }

    
    public function getCountByStatus()
    {
        $sql = "status=10";
        $data =  $this->getAllData($sql,[], "", true);
        return isset($data) ? count($data) : 0;
    }

    
    public function scrollingData(){
        $sql = "CURRENT_DATE() BETWEEN from_date AND to_date";
        $data = $this->getAllData($sql);
        return $data;
    }
}

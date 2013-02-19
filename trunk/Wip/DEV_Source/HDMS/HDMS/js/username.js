
var otable;
var upsearchname = "";
$(document).ready(function () {
    if ($("#toggle").val() == "true") {
        $("#toggleLink").attr("href", "/user?showDisabledUsers=no");
        $("#toggleLink").html("Hide disabled user");
    } else if (($("#toggle").val() == "false")) {
        $("#toggleLink").attr("href", "/user?showDisabledUsers=yes");
        $("#toggleLink").html("Show disabled user");
    }
    // Khoi tao du lieu cho table
    otable = $('#myDataTable').dataTable({
        "bJQueryUI": true,
        "bFilter": false,
        "bAutoWidth": false,
        /*  "bStateSave": true, // save trang thai moi khi load lai table*/
        "bServerSide": true,  // co su dung ham o Controller khong
        "sAjaxSource": "User/LoadUser",  // goi ham o Controller
        // "bProcessing": true,  // Hien muc xoay xoay processing
        "sPaginationType": "full_numbers", // hien paging
        //                 "fnServerParams": function ( aoData ) {
        //                     aoData.push({ "name": "searchUser", "value": searchname });
        //                },
        "fnServerParams": function (aoData) {
            aoData.push({ "name": "searchUser", "value": upsearchname });
            aoData.push({ "name": "showDisabledUsers", "value": showDisabledUsers });
        },
        "aoColumns": [

                { "sName": "UserName", "sWidth": "22%" },
                { "sName": "Email", "sWidth": "15%" },
                { "sName": "roles", "sWidth": "20%" },
                { "sName": "customer", "sWidth": "15%" },
                { "sName": "CreationDate", "sWidth": "15%" },

                 { "sName": "ID",
                     "bSearchable": true,
                     "bSortable": true,
                     "fnRender": function (oObj) {

                         var result = "";
//                         console.log(oObj.aData[1] + " : " + oObj.aData[6]);
//                         console.log("------------------------------------");
//                         console.log(oObj.aData[6] == "True");
                         if (oObj.aData[6] == "True") {
                             result = '<button class="btn btn-success" title="Update Role" onclick = "updateUser(\'' + oObj.aData[0] + '\')" ><i class="icon-edit icon-white"></i> </button>'
                                              +
                                             '<button class="btn btn-danger" title="Disable"  data-toggle="modal" data-target="#deletedialog" onclick = "deleteUser(\'' + oObj.aData[0] + '\')" ><i class="icon-minus icon-white"></i></button>'
                                             +
                                             '<button class="btn btn-primary" title="Reset Password"  data-toggle="modal" data-target="#resetdialog" onclick = "resetUser(\'' + oObj.aData[0] + '\')" ><i class="icon-refresh icon-white"></i></button>'
                                             ;
                         }
                         else {
                             result =
                                             '<button class="btn btn-primary" title="Enable"  data-toggle="modal" data-target="#deletedialog" onclick = "enableUser(\'' + oObj.aData[0] + '\')" ><i class="icon-plus icon-white"></i></button>';
                         }
                         return result;
                         //                         return '<button class="btn btn-success" title="Update Role" onclick = "updateUser(\'' + oObj.aData[0] + '\')" ><i class="icon-edit icon-white"></i> </button>'
                         //                                              +
                         //                                             '<button class="btn btn-danger" title="Disable"  data-toggle="modal" data-target="#deletedialog" onclick = "deleteUser(\'' + oObj.aData[0] + '\')" ><i class="icon-trash icon-white"></i></button>';

                     },
                     "sWidth": "18%"
                 },

            ]

    });
});
//         Khai bao update dialog form
//        $("#updatedialog").dialog({ autoOpen: false, modal: true, width: "350px" });
//        $("#deletedialog").dialog({ autoOpen: false, modal: true, width: "350px" });
//});
//+ "','" + oObj.aData[2]
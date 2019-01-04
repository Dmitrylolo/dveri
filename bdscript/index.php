<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        1
        <?php
        echo "что нибудь";
        $host = "localhost";
        $dbname1 = "old_dveri";
        $dbname2 = "matras2";        
        $dblogin = "root";
        $dbpwrd = "";
                
        mysql_connect($host, $dblogin, $dbpwrd) or die(mysql_error());
        mysql_select_db($dbname1) or die(mysql_error());
        
        
        $sql1 = "SELECT *, p.product_id FROM `product` as pp
                LEFT JOIN `product_price` as p
                on p.product_id = pp.product_id
                LEFT JOIN `product_manufacturer_xref` as po
                on po.product_id = pp.product_id
                ORDER BY pp.product_id ASC";
        
        $res = mysql_query($sql1) or die(mysql_error());
        
        echo "oc_product:<br><br>";
        
        while ($row = mysql_fetch_array($res)) {
            
            $query = "INSERT INTO `matras2`.`oc_product` "
                    . "(`product_id`, `model`, `sku`, `upc`, "
                    . "`ean`, `jan`, `isbn`, `mpn`, "
                    . "`location`, `quantity`, `stock_status_id`, `image`, "
                    . "`manufacturer_id`, `shipping`, `price`, `points`, "
                    . "`tax_class_id`, `date_available`, `weight`, `weight_class_id`, "
                    . "`length`, `width`, `height`, `length_class_id`, "
                    . "`subtract`, `minimum`, `sort_order`, `status`, "
                    . "`viewed`, `date_added`, `date_modified`) "
                    . "VALUES (".$row["product_id"].", '".$row["manufacturer_id"]."".$row["product_id"]."', '', '', "
                    . "'', '', '', '', "
                    . "'', '1000', '1', 'doors/".$row["product_full_image"]."', "
                    . "'".$row["manufacturer_id"]."', '1', '".$row["product_price"]."', '0', "
                    . "'', '2016-06-09', '0.00000000', '0',"
                    . " '0.00000000', '0.00000000', '0.00000000', '0', "
                    . "'1', '1', '0', '1', "
                    . "'0', '2016-06-09 00:00:00', '2016-06-09 00:00:00');";
            mysql_query($query) or die(mysql_error());
            
            $query = "INSERT INTO `matras2`.`oc_url_alias` "
                    . "(`url_alias_id`, `query`, `keyword`) "
                    . "VALUES (NULL, 'product_id=".$row["product_id"]."', '".$row["product_url_name"]."');";        
            mysql_query($query) or die(mysql_error());
            
            $query = "INSERT INTO `matras2`.`oc_product_to_store` (`product_id`, `store_id`) VALUES ('".$row["product_id"]."', '0');";        
            mysql_query($query) or die(mysql_error());
            
            echo "продукт №".$row["product_id"]." успешно добавлен..<br>";  
        }
        
        mysql_select_db($dbname1) or die(mysql_error());
        $sql2 = "SELECT *, p.product_id FROM `product` as pp
                LEFT JOIN `product_price` as p
                on p.product_id = pp.product_id
                LEFT JOIN `product_manufacturer_xref` as po
                on po.product_id = pp.product_id
                ORDER BY pp.product_id ASC";
        
        $res = mysql_query($sql2) or die(mysql_error());
        
        echo "oc_product_description:<br><br>";
        
        while ($row = mysql_fetch_array($res)) {
            
            $query = "INSERT INTO `matras2`.`oc_product_description` "
                    . "(`product_id`, `language_id`, `name`, `description`, "
                    . "`tag`, `meta_title`, `meta_description`, `meta_keyword`) "
                    . "VALUES ('".$row["product_id"]."', '2', '".$row["product_sku"]."', '".$row["product_desc"]."', "
                    . "'', '".$row["product_title"]."', '".$row["product_meta_description"]." ', '".$row["product_meta_keywords"]." ');";
            mysql_query($query) or die(mysql_error());
            echo "продукт №".$row["product_id"]." успешно добавлен..<br>"; 
        }
        
       mysql_select_db($dbname1) or die(mysql_error());

        $sql3 = "SELECT * FROM `old_dveri`.`manufacturer`";
        
        $res = mysql_query($sql3) or die(mysql_error());
        
       echo "oc_manufacturer:<br><br>";
        
        while ($row = mysql_fetch_array($res)) {
            
            $query = "INSERT INTO `matras2`.`oc_manufacturer` "
                    . "(`manufacturer_id`, `name`, `image`, `sort_order`) "
                    . "VALUES ('".$row["manufacturer_id"]."', '".$row["mf_name"]."', NULL, '');";            
            mysql_query($query) or die(mysql_error());
            
            $query = "INSERT INTO `matras2`.`oc_url_alias` "
                    . "(`url_alias_id`, `query`, `keyword`) "
                    . "VALUES (NULL, 'manufacturer_id=".$row["manufacturer_id"]."', '".$row["mf_url"]."');";
            mysql_query($query) or die(mysql_error()); 
            
            $query = "INSERT INTO `matras2`.`oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES ('".$row["manufacturer_id"]."', '0');";        
            mysql_query($query) or die(mysql_error());
            
            echo "производитель №".$row["manufacturer_id"]." успешно добавлен..<br>";  
        }
        
        mysql_select_db($dbname1) or die(mysql_error());
        $sql4 = "SELECT *, c.category_id FROM `category_xref` as cc
                LEFT JOIN `category` as c
                on c.category_id = cc.category_child_id
                ORDER BY c.category_id ASC";
        
        $res = mysql_query($sql4) or die(mysql_error());
        
       echo "oc_category:<br><br> ";
        
        while ($row = mysql_fetch_array($res)) {
            if ($row["category_parent_id"] !=0 or $row["category_child_id"] !=2){
                $i = $row["category_parent_id"];
                if ($row["category_parent_id"] == 2){
                    $i = 0;
                }
//                $query = "INSERT INTO `matras2`.`oc_category` "
//                        . "(`category_id`, `image`, `parent_id`, "
//                        . "`top`, `column`, `sort_order`, "
//                        . "`status`, `date_added`, `date_modified`) "
//                        . "VALUES ('".$row["category_id"]."', NULL, '".$i."', "
//                        . "'0', '0', '0', "
//                        . "'1', '2016-06-09 00:00:00', '2016-06-09 00:00:00');";            
//                mysql_query($query) or die(mysql_error());
//            
                $query = "INSERT INTO `matras2`.`oc_url_alias` "
                        . "(`url_alias_id`, `query`, `keyword`) "
                        . "VALUES (NULL, 'category_id=".$row["category_id"]."', '".$row["category_url_name"]."');";
                mysql_query($query) or die(mysql_error()); 
            
//                $query = "INSERT INTO `matras2`.`oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$row["category_id"]."', '0');";        
//                mysql_query($query) or die(mysql_error());
//            
//                $query = "INSERT INTO `matras2`.`oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$row["category_id"]."', '0', '0');";        
//                mysql_query($query) or die(mysql_error());
//            
                echo "категория №(".$row["category_id"].") с родителем № ".$row["category_parent_id"]." успешно добавлены<br>";  
            }
        }
//        
//        $sql3 = "SELECT * FROM `old_dveri`.`category_xref`";
//        $res = mysql_query($sql3) or die(mysql_error());
//        
//        while ($row = mysql_fetch_array($res)) {
//            
//            if ($row["category_parent_id"] !=0 && $row["category_parent_id"] !=2){
//                $query = "INSERT INTO `matras2`.`oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$row["category_child_id"]."', '".$row["category_parent_id"]."', '0');";        
//                mysql_query($query) or die(mysql_error());
//                $query = "INSERT INTO `matras2`.`oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$row["category_child_id"]."', '".$row["category_child_id"]."', '1');";        
//                mysql_query($query) or die(mysql_error());
//                
//            } elseif ($row["category_parent_id"] !=0 && $row["category_parent_id"] == 2) {
//                $query = "INSERT INTO `matras2`.`oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$row["category_child_id"]."', '".$row["category_child_id"]."', '0');";        
//                mysql_query($query) or die(mysql_error()); 
//            }            
//        }
//        
//        
//        mysql_select_db($dbname1) or die(mysql_error());
//        $sql4 = "SELECT *, c.category_id FROM `category_xref` as cc
//                LEFT JOIN `category` as c
//                on c.category_id = cc.category_child_id
//                ORDER BY c.category_id ASC";
//        
//        $res = mysql_query($sql4) or die(mysql_error());
//        
//        echo "oc_category_description:<br><br> ";
//        
//        while ($row = mysql_fetch_array($res)) {
//            
//            $query = "INSERT INTO `matras2`.`oc_category_description` "
//                    . "(`category_id`, `language_id`, `name`, "
//                    . "`description`, `meta_title`, `meta_description`, `meta_keyword`) "
//                    . "VALUES ('".$row["category_id"]."', '2', '".$row["category_name"]."', "
//                    . "'".$row["category_description"]."', '".$row["title_mebellife"]."', '".$row["meta_description_mebellife"]."', '".$row["meta_keywords_mebellife"]."');";
//            
//            mysql_query($query) or die(mysql_error());
//            echo "категория №".$row["category_id"]." успешно добавлена<br>";  
//        }
        
        mysql_select_db($dbname1) or die(mysql_error());
        $sql5 = "SELECT *, p.product_id FROM `product_category_xref` as pc
                LEFT JOIN `product` as p
                on p.product_id = pc.product_id
                LEFT JOIN `category_xref` as c
                on c.category_child_id = pc.category_id
                ORDER BY p.product_id ASC";
        
        $res = mysql_query($sql5) or die(mysql_error());
        
        echo "oc_product_to_category:<br><br> ";
        
        while ($row = mysql_fetch_array($res)) {
            $uu=0;
            $a= "-"; 
            echo "category_parent_id = ".$row["category_parent_id"]."; i= ".$uu."<br>";
            if ($row["category_parent_id"] !=0 && $row["product_id"]!=0){
                if ($row["category_parent_id"] == 2) {
                    $uu=1;
                    $a="+";
                }
                $query = "INSERT INTO `matras2`.`oc_product_to_category` "
                    . "(`product_id`, `category_id`, `main_category`) "
                    . "VALUES ('".$row["product_id"]."', '".$row["category_id"]."', '".$row["category_parent_id"]."');";
            
                mysql_query($query) or die(mysql_error());
                echo "продукт №".$row["product_id"]." конечная папка - ".$row["category_id"]."; главная папка - ".$row["category_parent_id"]." успешно добавлен..<br>";     
            } 
                    
              
        }
        
       
        
        ?>
    </body>
</html>

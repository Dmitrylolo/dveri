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
        $dbname1 = "new_dveri";
        $dbname2 = "matras2";        
        $dblogin = "root";
        $dbpwrd = "";
                
        mysql_connect($host, $dblogin, $dbpwrd) or die(mysql_error());
        mysql_select_db($dbname1) or die(mysql_error());
        
        
        $sql1 = "SELECT * FROM `oc_product` WHERE `manufacturer_id` = 19";
        
        $res = mysql_query($sql1) or die(mysql_error());
        
        echo "oc_product:<br><br>";
        
        while ($row = mysql_fetch_array($res)) {

            echo $row[price]."->";


            $row[price] = round($row[price]*0.9);
            
            $query = "UPDATE `oc_product` SET `price` = ".$row[price]." WHERE `oc_product`.`product_id` = ".$row[product_id]."; ";
            mysql_query($query) or die(mysql_error());
            
            echo $row[price];
            echo "цена на продукт №".$row["product_id"]." успешно изменена..<br>";  
        }
        
        ?>

    </body>
</html>

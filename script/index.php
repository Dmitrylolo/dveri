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
        <?php
        $host = "localhost";
        $dbname1 = "odveri";
        $dbname2 = "matras2";        
        $dblogin = "root";
        $dbpwrd = "";
                
        mysql_connect($host, $dblogin, $dbpwrd);
        mysql_select_db($dbname1);
        
        $sql = "SELECT *, p.product_id FROM `product`"
                . "LEFT JOIN product_price as pp"
                . "on pp.product_id = p.product_id"
                . "LEFT JOIN product_manufacturer_xref as po"
                . "on po.product_id = p.product_id";
        
        
        
        
        
        
        
        
        $res = mysql_query($sql) or die(mysql_error());
        $oc_product = mysql_fetch_array($res) or die(mysql_error());
        
        echo var_dump($oc_product);
        
        /*
        
        $res = mysql_query("SELECT * FROM category") or die(mysql_error());
        $category = mysql_fetch_array($res) or die(mysql_error());
        
        $res = mysql_query("SELECT * FROM manufacturer") or die(mysql_error());
        $manufacturer = mysql_fetch_array($res) or die(mysql_error());
        
        $res = mysql_query("SELECT * FROM product") or die(mysql_error());
        $products = mysql_fetch_array($res) or die(mysql_error());
        
        $res = mysql_query("SELECT * FROM product") or die(mysql_error());
        $products = mysql_fetch_array($res) or die(mysql_error());
        
        $res = mysql_query("SELECT * FROM product") or die(mysql_error());
        $products = mysql_fetch_array($res) or die(mysql_error());
        
        
        
        
        
        
        */
        
        ?>
    </body>
</html>

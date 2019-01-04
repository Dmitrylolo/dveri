<!doctype html>

<html>

<head>

<meta charset="utf-8">

<title>Документ без названия</title>

</head>



<body>

       <?php

        echo "что нибудь";

        $host = "localhost";

        $dbname1 = "matras2";

        $dbname2 = "matras2";        

        $dblogin = "root";

        $dbpwrd = "";

                

        mysql_connect($host, $dblogin, $dbpwrd) or die(mysql_error());

        

        

        mysql_select_db($dbname1) or die(mysql_error());

        $sql5 = "SELECT *, p.product_id FROM `oc_product_to_category` as pc

                LEFT JOIN `oc_product` as p

                on p.product_id = pc.product_id

                WHERE pc.category_id = 5

                ORDER BY p.product_id ASC";

        

        $res = mysql_query($sql5) or die(mysql_error());

        

		while ($row = mysql_fetch_array($res)) {

            

                $query = "INSERT INTO `matras2`.`oc_product_option` (

						`product_option_id` , `product_id` , `option_id` , `value` ,`required`)

						VALUES (NULL , '".$row['product_id']."', '19', '', '0');";

            

                mysql_query($query) or die(mysql_error());

			  

			 $i = mysql_insert_id();

				

				

				$query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '19', '71', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());

			  

			  $query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '19', '72', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());

			  

			  $query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '29', '73', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());

                $query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '29', '74', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());

                $query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '19', '75', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());

			  



                echo "размер для товара № = ".$row["product_id"]." добавлен <br>";     

            

                    

              

        }

        

        mysql_select_db($dbname1) or die(mysql_error());

        $sql5 = "SELECT *, p.product_id FROM `oc_product_to_category` as pc

                LEFT JOIN `oc_product` as p

                on p.product_id = pc.product_id

                WHERE pc.category_id = 5

                ORDER BY p.product_id ASC";

        

        $res = mysql_query($sql5) or die(mysql_error());

        

		while ($row = mysql_fetch_array($res)) {

            

                 $query = "INSERT INTO `matras2`.`oc_product_option` (

						`product_option_id` , `product_id` , `option_id` , `value` ,`required`)

						VALUES (NULL , '".$row['product_id']."', '20', '', '0');";

            

                mysql_query($query) or die(mysql_error());

			  

			 $i = mysql_insert_id();

				

				

							  $query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '20', '76', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());

			  

			  $query = "INSERT INTO `matras2`.`oc_product_option_value` (

						`product_option_value_id` , `product_option_id` , `product_id` , `option_id` ,`option_value_id` ,`quantity` ,`subtract` ,`price` ,`price_prefix` ,`points` ,`points_prefix` ,`weight` ,`weight_prefix` ,`optsku`)

						VALUES (NULL , '".$i."', '".$row['product_id']."', '20', '77', '0', '0', '0.0000', '+', '0', '+', '0.00000000', '+', NULL);";

            

                mysql_query($query) or die(mysql_error());	

			



			

			echo "открывание для товара № = ".$row["product_id"]." добавлен <br>";  

		}

	

	 
        

        ?>

</body>

</html>
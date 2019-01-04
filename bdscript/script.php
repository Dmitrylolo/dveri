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
        $dbname1 = "dveri2";
        $dbname2 = "matras2";        
        $dblogin = "root";
        $dbpwrd = "";
                
        $q=mysql_connect($host, $dblogin, $dbpwrd);
        mysql_select_db($dbname2) or die(mysql_error());
		
		$category_to_add = array(
								"противопожарные" => "protivopozharnie-dveri",
								"звукоизолирующие" => "zvukoizoliruyushie-dveri",
								"влагостойкие" => "vlagostojkie-dveri",
								"для саун" => "dveri-dlya-saun",
								"для душевых кабин" => "dveri-dlya_dushevih-kabin",
								"из нержавеющей стали" => "dveri-iz-nerjaveyushei-stali",
								"металлопласткиеовые" => "metalloplastikovie-dveri"		
		);
$i=94;
    function my_ucfirst($string, $e ='utf-8') {
        if (function_exists('mb_strtoupper') && function_exists('mb_substr') && !empty($string)) {
            $string = mb_strtolower($string, $e);
            $upper = mb_strtoupper($string, $e);
            preg_match('#(.)#us', $upper, $matches);
            $string = $matches[1] . mb_substr($string, 1, mb_strlen($string, $e), $e);
        } else {
            $string = ucfirst($string);
        }
        return $string;
    } 
		foreach ($category_to_add as $name => $url_name)
		{
				$Name = my_ucfirst ($name) or die("oshibka");
				$descritpion = "<h3>".my_ucfirst ($name)." двери специального назначения</h3>";
				$descritpion .= "<h4>описание</h4>";
				$descritpion .= "<p>описание категории <a href=\"".urlencode($url_name)."\">".$name."</a> двери специального назначения.</p>";
				$descritpion .= "<h4>как выбрать ".$name." двери?</h4>";
				$descritpion .= "<p>нужно описать как выбрать двери данного типа.</p>";
/*				echo "description for category is: ".$descritpion.".<br>";
						
                $query = "INSERT INTO `matras2`.`oc_category` "
                        . "(`category_id`, `image`, `parent_id`, "
                        . "`top`, `column`, `sort_order`, "
                        . "`status`, `date_added`, `date_modified`) "
                        . "VALUES (NULL, NULL, '44', "
                        . "'0', '0', '0', "
                        . "'1', '2016-06-09 00:00:00', '2016-06-09 00:00:00');";;
                mysql_query($query) or die();
				$id = mysql_insert_id($q) or die();
				echo "id = ".$id;
				
				$query = "INSERT INTO `matras2`.`oc_url_alias` "
                        . "(`url_alias_id`, `query`, `keyword`) "
                        . "VALUES (NULL, 'category_id=".$id."', '".$url_name."');";
                mysql_query($query) or die(mysql_error()); 
				
				$query = "INSERT INTO `matras2`.`oc_category_to_store` (`category_id`, `store_id`) VALUES ('".$id."', '0');";        
                mysql_query($query) or die(mysql_error());
            
                $query = "INSERT INTO `matras2`.`oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES ('".$id."', '0', '0');";        
                mysql_query($query) or die(mysql_error());*/
				
				            $query = "INSERT INTO `matras2`.`oc_category_description` "
                   					 . "(`category_id`, `language_id`, `name`, "
                   					 . "`description`, `meta_title`, `meta_description`, `meta_keyword`) "
                 					 . "VALUES ('".$i."', '2', '".my_ucfirst ($name)."', "
                   					 . "'".mysql_real_escape_string($descritpion)."', '".my_ucfirst($name)."', '".my_ucfirst($name)."', '".my_ucfirst($name)."');";
									 mysql_query($query) or die(mysql_error());
				echo $descritpion."<br><br>";

				echo $i." query='".strip_tags($query)."'.<br><br>";
				$i++;
				
		};
//				for ($i = 94; $i<=100; $i++) { 
//                $query = "INSERT INTO `matras2`.`oc_category_path` (`category_id`, `path_id`, `level`) VALUES ('".$i."', '".$i."', '1');";  
//				echo $i." query='".$query."'.<br><br>";
//				mysql_query($query) or die(mysql_error());
				//echo "category named  ".$name." has been added with url = <a href=\"".urlencode($url_name)."\">".$name."</a><br>";
//				}
		?>
        
		
		
    </body>
</html>

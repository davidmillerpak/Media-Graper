<?php
$a=getopt("p:");
if(count($a['p'])>1){
	$url=file_get_contents($a['p'][0]);
	$doc = new DOMDocument();
	@$doc->loadHTML($url);
	$mime=intval($a['p'][1]);
	echo "Media-Graper @ https://github.com/davidmillerpak/Media-Graper ";
	if($mime==2){
		$tags = $doc->getElementsByTagName('video');
		echo "saved ".count($tags)." Results.\n\n";
	    foreach ($tags as $tag) {
	      echo $tag->getAttribute('src')."\n";
	    }
	}else if($mime==3){
		$tags = $doc->getElementsByTagName('a');
		echo "saved ".count($tags)." Results.\n\n";
	    foreach ($tags as $tag) {
	      echo $tag->getAttribute('href')."\n";
	    }
	}else if($mime==4){
		$tags = $doc->getElementsByTagName('meta');
		echo "saved ".count($tags)." Results.\n\n";
	    foreach ($tags as $tag) {
	      if(!empty($tag->getAttribute('name'))){
	      	$mtn=$tag->getAttribute('name');
	      }else if(!empty($tag->getAttribute('property'))){
	      	$mtn=$tag->getAttribute('property');
	      }else{
	      	$mtn="unnamed";
	      }
	      echo $mtn." - ".$tag->getAttribute('content')."\n";
	    }
	}else if($mime==5){
		$tags = $doc->getElementsByTagName('script');
		echo "saved ".count($tags)." Results.\n\n";
	    foreach ($tags as $tag) {
	    	if(!empty($tag->getAttribute('src'))){
	    		echo $tag->getAttribute('src')."\n";
	    	}else{
	    		echo "Internal Scripts.\n";
	    	}
	    }
	}else if($mime==6){
		$tags = $doc->getElementsByTagName('link');
		echo "saved ".count($tags)." Results.\n\n";
	    foreach ($tags as $tag) {
	    	if(!empty($tag->getAttribute('rel')) && $tag->getAttribute('rel')=="stylesheet"){
	    		echo $tag->getAttribute('href')."\n";
	    	}else{
	    		echo "Internal Stylesheets.\n";
	    	}
	    }
	}else{
		$tags = $doc->getElementsByTagName('img');
		echo "saved ".count($tags)." Results.\n\n";
	    foreach ($tags as $tag) {
	      echo $tag->getAttribute('src')."\n";
	    }
	}
	
}
#!/bin/bash
clear
if ! command -v php > /dev/null
then
    echo -ne "\n\e[1;77m[CRITICAL]\e[0m \e[1;91mPHP require, Please Install it and try again later.\e[0m"
    exit
else
   printf "\e[1;94m______________________________________________\e[0m\e[1;77m______________________________________________\e[0m\n\n"
   printf "\e[1;77m                               ___ __  ___  _ \e[0m\e[1;94m   _   __   _  __  ___ __  \e[0m\n"
   printf "\e[1;77m                          )\/) )_  ) )  )  /_)\e[0m\e[1;94m  / _  )_) /_) )_) )_  )_) \e[0m\n"
   printf "\e[1;77m                         (  ( (__ /_/ _(_ / / \e[0m\e[1;94m (__/ / \ / / /   (__ / \  \e[0m\n"
   printf "\e[1;77m                                              \e[0m\e[1;94m                           \e[0m\n"
   printf "\e[1;94m______________________________________________\e[0m\e[1;77m______________________________________________\e[0m\n"
fi


echo -ne "\n     \e[1;88m1.\e[0m \e[1;32mImages\e[0m"
echo -ne "\n     \e[1;88m2.\e[0m \e[1;32mVideos\e[0m"
echo -ne "\n     \e[1;88m3.\e[0m \e[1;32mLinks \e[0m"
echo -ne "\n     \e[1;88m4.\e[0m \e[1;32mMeta Data \e[0m"
echo -ne "\n     \e[1;88m5.\e[0m \e[1;32mScripts    (.js)\e[0m"
echo -ne "\n     \e[1;88m6.\e[0m \e[1;32mStylesheet (.css)\e[0m\n\n"
echo -ne "    \e[1;88m[Options]\e[0m \e[1;32mWhat you want to extract? [option 1 is default] \e[0m"
read mety
if [ $mety -eq 2 ] 
   then mety=2 
        meta="video_extract_"
   echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mVideo Extractor Selected\e[0m"
elif [ $mety -eq 3 ]
   then mety=3
        meta="link_extract_"
   echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mLink Extractor Selected\e[0m"
elif [ $mety -eq 4 ]
   then mety=4
        meta="meta_extract_"
   echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mMeta Data Extractor Selected\e[0m"
elif [ $mety -eq 5 ]
   then mety=5
        meta="script_source__"
   echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mMeta Data Extractor Selected\e[0m"
elif [ $mety -eq 6 ]
   then mety=6
        meta="stylesheet_source_"
   echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mStylesheet Extractor Selected\e[0m"
else
   meta="image_extract_"
   mety=1
   echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mImage Extractor Selected\e[0m"
fi
sleep 1
echo -ne "\n\n    \e[1;88m[+]\e[0m \e[1;32mEnter URL of Target Website : \e[0m"
read url
sleep 1
echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mExtractor started working, wait a few second .......\e[0m\n"
fname="$meta$(date +%T).txt"
php main.php -p $url -p $mety > output/$fname
##php main.php -p $url -p $mety
echo -ne "\n    \e[1;88m[+]\e[0m \e[1;32mFile saved as output/$fname\e[0m\n"

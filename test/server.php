<?php
class API {

    public function hello($num) {
        var_dump($num);
        return $num+1;
    }
}

$service = new Yar_Server(new API());
$service->handle();
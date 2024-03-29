<?php
/**
 * Created by PhpStorm.
 * User: wang
 * Date: 2019/9/3
 * Time: 19:19
 */

namespace frontend\controllers;
use Yii;
use frontend\models\NsGoods;
use frontend\models\NsCategory;
use yii\web\Controller;

class NpiController extends ApiController
{
    public $modelClass='frontend\models\NsCategory';   
    public function actionList(){
        $list = NsCategory::find()->where(['pid'=>0])->asArray()->all();

        $pid=Yii::$app->request->get('id',$list[0]['id']);

        $list2 = NsCategory::find()->where(['pid'=>$pid])->asArray()->all();
        foreach($list2 as $k=>$v){
            $list2[$k]["goods_list"]=Nsgoods::find()->where(['category'=>$v['id']])->asArray()->all();
        }
        $data['stair']=$list;
        $data['second']=$list2;
       // print_r($data);die;
        return $data;
        $data =array(
            "code"=>0,
            "message"=>"",
            "data"=>$data
        );
       echo json_encode($data);
    }
}

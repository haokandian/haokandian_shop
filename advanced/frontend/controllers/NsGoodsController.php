<?php
/**
 * Created by PhpStorm.
 * User: wang
 * Date: 2019/9/2
 * Time: 15:24
 */

namespace frontend\controllers;

use frontend\models\NsGoods;
use yii\web\Controller;

class NsGoodsController extends ApiController
{
    public $modelClass='frontend\models\NsCategory';   
    public function actionList(){
        $list = NsGoods::find()->where(['is_recommend'=>1])->asArray()->all();
      
        return $list;
        
    }
}

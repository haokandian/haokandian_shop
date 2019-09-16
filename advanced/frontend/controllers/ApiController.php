<?php
/**
 * api 基类
 * Created by PhpStorm.
 * Author: L
 * Date: 2019/1/9
 * Time: 9:33
 */


namespace frontend\controllers;

use Yii;
use yii\filters\ContentNegotiator;
use yii\filters\VerbFilter;
use yii\rest\ActiveController;
use yii\web\Response;
use yii\filters\auth\QueryParamAuth;
use yii\filters\auth\HttpBasicAuth;
use yii\filters\auth\CompositeAuth;
use yii\filters\Cors;

class ApiController extends ActiveController
{
    public function behaviors()
    {

        $behaviors = parent::behaviors();


        $behaviors['authenticator'] = [
            'class' => CompositeAuth::className(),
            'authMethods' => [
                QueryParamAuth::className(),
            ],
            // 写在optional里的方法不需要token验证
            'optional' => [
                'login'
            ],
        ];
        // 这个是跨域配置
        $behaviors['corsFilter'] = [
            'class' => Cors::className(),
            'cors' => [
                'Origin' => ['*'],
                // restrict access to
                'Access-Control-Request-Method' => ['POST', 'GET', 'DEL'],
                // Allow only POST and PUT methods
                'Access-Control-Request-Headers' => ['Origin', 'X-Requested-With', 'Content-Type', 'Accept'],
                // Allow only headers 'X-Wsse'
                'Access-Control-Allow-Credentials' => true,
                // Allow OPTIONS caching
                'Access-Control-Max-Age' => 3600,
                // Allow the X-Pagination-Current-Page header to be exposed to the browser.
                'Access-Control-Expose-Headers' => ['X-Pagination-Current-Page'],
            ],
        ];


        # 定义返回格式是：JSON
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;

        return $behaviors;
    }
}

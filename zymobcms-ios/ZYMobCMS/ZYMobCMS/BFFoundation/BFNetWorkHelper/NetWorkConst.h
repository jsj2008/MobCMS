//
//  NetWorkConst.h
//  OPinion
//
//  Created by ZYVincent on 12-7-19.
//  Copyright (c) 2012年 __barfoo__. All rights reserved.
//

#define ZYCMS_Base_Url @"http://192.168.1.103/MobCMS/zymobcms-server/zymobcms/index.php?r="
#define ZYCMS_image_Url @"http://192.168.1.103/MobCMS/zymobcms-server/zymobcms/"
#define MCM_Base_Url @"https://61.136.59.251:8017"

#define APPID            @"zymobcmsnew1"

#define PPF_HOST_KEY @"ppf12" //对应服务器返回主机列表的key TODO
#define MCM_HOST_KEY @"mcm"

/* 
 参数说明
 1. 用户权限参数(除登录外，所有通信都需要添加以下两个参数)
 uid     用户ID
 token   用户通信标记
 
 2. 分页参数(返回数据列表时，以下两个变量作为分页控制参数据)
 pageindex   页标
 pagesize    页码
 
 返回数据说明
 status      请求状态 true | false, 当false 时通信失败或交互失败，errormsg 输出异常信息
 data        返回数据,按需求返回的数据有可能是jsonobject或jsonarray
 errormsg    异常信息 
 */

#define _pageSize       15
#define _total         100

/*
     登陆
 
     参数
        username
        password
        imei
     retrun 
        (status,account|msg)
 */

#define ZYCMS_Login_Interface            @"Mobile/user/login"


/*
 修改用户信息
 
 参数：
 iostoken
 uid
 token
 */

#define ZYCMS_Rigist_Interface            @"Mobile/user/rigist"


/*
    获取host
 
    参数
        appid  ""
 */

#define ZYCMS_Menu_List_Interface            @"Mobile/menu/menuList"


/*
    获取用户首页快捷方式
    retrun 
        (status, list(navitem)) 
 */
#define ZYCMS_Tab_Type_Interface            @"Mobile/menu/categoryTabType"

/*
    添加用户快捷方式
    参数：
        type:类型
        navid:原分类编号
    retrun 
        (status, msg)  
 */
#define ZYCMS_News_List_Interface           @"Mobile/newsList/newsList"

/*
     删除用户局势方式
     参数：
         type:类型
         navid:原分类编号
     retrun 
        (status, msg)  
 */
#define ZYCMS_Article_Detail_Interface     @"Mobile/newsList/articleDetail"


/*
 用户顶级分类目录
 retrun
 (status, list(classify))
 */
#define ZYCMS_Article_Comment_Interface     @"Mobile/newsList/articleComment"


/*
 用户子分类目录树
 retrun
 (status, list(classify))
 */
#define ZYCMS_Comment_Article_Interface     @"Mobile/newsList/commentArticle" //@"/m/classify/tree"

   
/*
     获取分类数据
     参数：
        cid:分类ID,
        typeid:类型ID({0其他，1新闻，2论坛，3博客，4微博，5视频，6首页，7境外，8传统媒体})
     retrun 
        (status, list(result)  
 */
#define ZYCMS_Favorite_Article_Interface     @"Mobile/newsList/favoriteArticle"


/*
    获取分类子类TAB
    参数：
        classid: 分类ID
 */

#define ZYCMS_Picture_Interface        @"Mobile/picture/pictureList"


/*
     分类信息详情页
     参数：
        aid:分类详细ID,
     retrun 
        (status, result)  
 */
#define ZYCMS_Product_List_Interface     @"Mobile/product/productList"


/*
     微博分类信息详情页
     参数：
        aid:分类详细ID,
     retrun
        (status, result)
 */
#define ZYCMS_Product_Detail_Interface     @"Mobile/product/productDetail"


/*
     预警统计(返回三个类型的新信息数)
     retrun 
        (status, result)  
 */
#define ZYCMS_User_Favorite_Interface     @"Mobile/user/favoriteList"

/*
     获取预警，关注，线索列表
     参数
        typeid
     retrun 
        (status, list(result))
 */
//#define Opinion_WarningList_Interface     @"/m/warning/getlist"

#define ZYCMS_User_Comment_Interface     @"Mobile/user/commentList"


/*
     本地搜索
     参数
        key 搜索关键词
     retrun 
     (status, list(result))
 */
#define ZYCMS_About_Interface     @"Mobile/about/aboutInfo"


/*
     微博搜索
     参数
        key 搜索关键词
     retrun 
        (status, list(blog))
 */
#define ZYCMS_Reply_Interface     @"Mobile/reply/reply"

/*
     搜索人物搜索
     参数
        key 搜索关键词
     retrun 
        (status, list(person))
 */
#define ZYCMS_Hot_Comment_Interface     @"Mobile/newsList/hotComments"

/*
 *搜索下得分类数据接口
 *参数:companyid,classid
 */
#define Opinion_Search_Tab_Bar_Interface   @"/m/classifytab/result"

/*
 *分页查询预警，线索，关注数据
 *参数:companyid,typeid,pageindex,pagesize
 */
//#define Opinion_Home_Page_List_Interface   @"/m/warning/pagelist"

//========================== MCM ============================

/*
 他人上报
 参数：
 starttime   时间区间
 */

#define Opinion_RecommendListIn_Interface       @"/m/recommend/myin" //@"/m/recommend/list_in"


/*
 上报信息
 参数：
 info_id     文章ID
 */

#define Opinion_RecommendInfo_Interface         @"/m/recommend/info"


/*
 文章信息
 参数：
 info_id     文章ID
 */

#define Opinion_ArchiveInfo_Interface           @"/m/archive/info"


/*
 我的上报
 参数：
 starttime   时间区间
 */

#define Opinion_RecommendListOut_Interface      @"/m/recommend/myout" //@"/m/recommend/list_out"


/*
 上报的回复列表
 参数：
 info_id   上报的ID
 */

#define Opinion_RecommendReplyListIn_Interface  @"/m/recommend/replyList"


/*
 我发出的回复列表
 */

#define Opinion_RecommendReplyListOut_Interface  @"/m/recommend/replyList_myout"


/*
 收到的回复列表
 参数：
 starttime
 */

#define Opinion_RecommendReplyMeListIn_Interface  @"/m/recommend/replyList_myin"


/*
 转发上报
 参数：
 info_id
 pusher
 push_content
 receiver（为多个用户id,以","分割）
 */

#define Opinion_Repost_Interface                 @"/m/recommend/repost"


/*
 上报领导
 参数：
 title
 content
 receiver（为多个用户id,以","分割）
 */

#define Opinion_Post_Interface                 @"/m/recommend/post"


/*
 回复上报
 参数：
 info_id
 replyer_id
 pusher
 reply_content
 ref_id
 ref_uid
 */

#define Opinion_ReplyRecommend_Interface         @"/m/recommend/reply"


/*
 推荐通知
 参数：
 starttime   此时间后的收到的上报信息数量
 */

#define Opinion_RecommendCount_Interface         @"/m/count/recommend"


/*
 回复通知
 参数：
 starttime   此时间后被回复的我的上报信息数量
 */

#define Opinion_ReplyCount_Interface             @"/m/count/reply"


/*
 获取图片
 参数：
 fid
 */

#define Opinion_GetImg_Interface                 @"/m/getimg"


/*
 删除上报
 参数：
 id
 type(0, 1) 0 上报信息 1回复
 */

#define Opinion_RemoveRecommend_Interface        @"/m/recommend/remove"


/*
 删除全部
 参数：
 id
 type(0, 1) type 0 清空上报 1 清空回复 不传或不是0/1则清空全部
 */

#define Opinion_RemoveAllRecommend_Interface        @"/m/recommend/removeall"


/*
 设置回复为已读
 _id
 */

#define Opinion_SetReplyRead_Interface        @"/m/recommend/setreplyread"


/*
 推送对象
 */

#define Opinion_UserList_Interface              @"/m/account/usertreebygroup"//@"/m/account/usertree"


/*
 *分类搜索,父类目录
 *参数:categroyId,compnayid,pageindex,pagesize
 *搜索时增加参数:Name
 */
#define Opinion_Classify_Category_Interface     @"/m/classify/category"


//=================== 搜索新增功能 ==========//

/*
 *本地高级搜索
 */
#define Opinion_LocalSearch_Interface           @"/m/search/localcontent"


/*
 *全网搜索
 */
#define Opinion_NetSearch_Interface             @"/m/search/netcontent"




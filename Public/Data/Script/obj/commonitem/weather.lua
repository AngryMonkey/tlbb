--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--脚本号
x331026_g_scriptId = 331026 --临时写这个,真正用的时候一定要改.

-- effect = Client/Config/EffectDefine.txt中定义的
-- time = 持续时间(秒)

x331026_g_itemList = {}
x331026_g_itemList[30509029] = {effect=2, time=60,
	msg1="#W#{_INFOUSR%s}#H见久旱无雨，田地龟裂，树木枯黄，心生不忍，遂掏出一个%s#H，口中念念有词，一时间只见天空乌云密布，风雨大作。",
	msg2="#W#{_INFOUSR%s}#H见#G%s#H久旱无雨，田地龟裂，树木枯黄，心生不忍，遂掏出一个%s#H，口中念念有词，一时间只见天空乌云密布，风雨大作。"}
x331026_g_itemList[30509030] = {effect=3, time=60,
	msg1="#W#{_INFOUSR%s}#H正在爱人面前赌咒发誓，若负对方将来必被天打雷劈。不料话音刚落，竟然真的雷声大作，闪电阵阵，顿时吓得面如土色，后来发现是身上的%s#H所致，方才松了口气。",
	msg2="#W#{_INFOUSR%s}#H正在爱人面前赌咒发誓，若负对方将来必被天打雷劈。不料话音刚落，#G%s#H竟然真的雷声大作，闪电阵阵，顿时吓得面如土色，后来发现是身上的%s#H所致，方才松了口气。"}
x331026_g_itemList[30509031] = {effect=4, time=60,
	msg1="#W#{_INFOUSR%s}#H被几个想打雪仗的小屁孩缠得没了办法，只得掏出珍藏已久%s#H，大叫一声“冤！”，天空登时下起鹅毛般的大雪来，众小屁孩才雀跃着跑开。",
	msg2="#W#{_INFOUSR%s}#H在#G%s#H被几个想打雪仗的小屁孩缠得没了办法，只得掏出珍藏已久%s#H，大叫一声“冤！”，天空登时下起鹅毛般的大雪来，众小屁孩才雀跃着跑开。"}
x331026_g_itemList[30509032] = {effect=5, time=60,
	msg1="#W#{_INFOUSR%s}#H为了增加与爱人花前月下的浪漫气氛，忍痛使用了得来不易的%s#H。",
	msg2="#W#{_INFOUSR%s}#H为了增加与爱人在#G%s#H花前月下的浪漫气氛，忍痛使用了得来不易的%s#H。"}
x331026_g_itemList[30509033] = {effect=6, time=60,
	msg1="#W#{_INFOUSR%s}#H正要与某武林高手比武，心中一动，提前使用了一个%s#H，但见满天竹叶飞舞，登时变得气势淩人起来。",
	msg2="#W#{_INFOUSR%s}#H正要与某武林高手在#G%s#H比武，心中一动，提前使用了一个%s#H，但见满天竹叶飞舞，登时变得气势淩人起来。"}
x331026_g_itemList[30509034] = {effect=7, time=60,
	msg1="#W#{_INFOUSR%s}#H在散步时，忽而诗兴大发，随手使用了一个%s#H，看着满天飞舞的枫叶，竟随口吟出“霜叶红于二月花”的佳句来，令路人刮目相看。",
	msg2="#W#{_INFOUSR%s}#H在#G%s#H散步时，忽而诗兴大发，随手使用了一个%s#H，看着满天飞舞的枫叶，竟随口吟出“霜叶红于二月花”的佳句来，令路人刮目相看。"}
x331026_g_itemList[30509035] = {effect=8, time=60,
	msg1="#W#{_INFOUSR%s}#H总被人讥笑脸嫩，心中不忿，一气之下使用了一个%s#H，从漫天的沙尘中走出后，满意地发现自己已经沧桑了许多。",
	msg2="#W#{_INFOUSR%s}#H总被人讥笑脸嫩，心中不忿，一气之下在#G%s#H使用了一个%s#H，从漫天的沙尘中走出后，满意地发现自己已经沧桑了许多。"}
x331026_g_itemList[30509036] = {effect=9, time=60,
	msg1="#W#{_INFOUSR%s}#H做梦都想发财，于是使用了一个%s#H，登时天空中元宝有如雨下，人们欢呼雀跃。",
	msg2="#W#{_INFOUSR%s}#H做梦都想发财，于是在#G%s#H使用了一个%s#H，登时中元宝有如雨下，人们欢呼雀跃。"}
x331026_g_itemList[30509052] = {effect=10, time=60,
	msg1="#H五月，是一场雷鸣后大雨来临，南飞的大雁跋山涉水归家的日子；在这烂漫的季节#W#{_INFOUSR%s}#H使用了一个#W%s#H，藉以赞美这冬麦扬穗农民挥汗荷锄，辛勤耕耘的好光景。",
	msg2="#H劳动是神奇的，劳动是伟大的。劳动者用勤劳的双手和智慧，编织了这个五彩班斓的世界，创造了人类的文明。#W#{_INFOUSR%s}#H在这个特别的日子里，在#G%s#H使用了一个#W%s#H向全世界的劳动者致敬！"}
x331026_g_itemList[30509066] = {effect=20, time=60,
	msg1="#H七夕将至，#W#{_INFOUSR%s}#H昨夜梦见牛郎织女鹊桥相会，羡慕无比，于是使用了一个#W%s#H，以此来向所有单身的人们散播爱的讯号！",
	msg2="#H七夕，鹊桥，银河，牛郎织女......#W#{_INFOUSR%s}#H在这个特别的日子里，突然心有所感，向#G%s#H的天空掷去一把#W%s#H，登时花雨纷飞。"}
x331026_g_itemList[30509071] = {effect=21, time=60,
	msg1="#{AOYYH_8804_01}#W#{_INFOUSR%s}#H激情澎湃地#{AOYYH_8804_03}%s#{AOYYH_8804_04}",
	msg2="#{AOYYH_8804_01}#W#{_INFOUSR%s}#H激情澎湃地在#G%s#{AOYYH_8804_03}%s#{AOYYH_8804_04}"}
x331026_g_itemList[30509083] = {effect=22, time=60,
	msg1="#H时至挚友生辰，#W#{_INFOUSR%s}#H亦喜不自禁，于是使用了一个#W%s#H，以此来表达对朋友最真挚的生日祝福！",
	msg2="#W#{_INFOUSR%s}#H在至交生日之际，于#G%s#H燃放了一个#W%s#H，并祝福道：愿所有的快乐、所有的幸福、所有的温馨、所有的好运都围绕在你身边，生日快乐！"}
--**********************************
--事件交互入口
--**********************************
function x331026_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x331026_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x331026_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x331026_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local curItem = x331026_g_itemList[itemTblIndex];
	if not curItem then
		x331026_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	local curWeather = LuaFnGetSceneWeather(sceneId);
	if not curWeather or curWeather ~= -1 then
		x331026_NotifyFailTips(sceneId, selfId, "特殊天气下无法使用该物品。");
		return 0;
	end

	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x331026_OnDeplete( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local curItem = x331026_g_itemList[itemTblIndex];
	if not curItem then
		x331026_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	local itemBagIndex = LuaFnGetBagIndexOfUsedItem(sceneId, selfId);
	local szTransferItem = GetBagItemTransfer(sceneId, selfId, itemBagIndex);
	local selfName = GetName(sceneId, selfId);
	
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
		if szTransferItem and selfName then
			local sceneType = LuaFnGetSceneType(sceneId);
			local strMsg;
			if sceneType and sceneType == 0 then
				local sceneName = GetSceneName(sceneId);
				strMsg = format(curItem.msg2, selfName, sceneName, "#{_INFOMSG"..szTransferItem.."}");
			else
				strMsg = format(curItem.msg1, selfName, "#{_INFOMSG"..szTransferItem.."}");
			end
			BroadMsgByChatPipe(sceneId, selfId, strMsg, 4);
		end
		return 1;
	end
	return 0;
end

--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x331026_OnActivateOnce( sceneId, selfId )
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local curItem = x331026_g_itemList[itemTblIndex];
	if not curItem then
		x331026_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	LuaFnSetSceneWeather(sceneId, curItem.effect, curItem.time * 1000 );
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x331026_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
-- 醒目失败提示
--**********************************
function x331026_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

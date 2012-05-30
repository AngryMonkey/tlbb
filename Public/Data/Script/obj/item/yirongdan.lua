--注意：

--物品技能的逻辑只能使用基础技能和脚本来实现

--脚本:

--以下是脚本样例:


------------------------------------------------------------------------------------------
--一般物品的默认脚本

--脚本号
x300029_g_scriptId = 300029 --临时写这个,真正用的时候一定要改.

--需要的等级

--效果的ID
x300029_g_itemList = {}
x300029_g_itemList[30501003] = {impactId=4828}
x300029_g_itemList[30501007] = {impactId=4836}
x300029_g_itemList[30501008] = {impactId=4837}
x300029_g_itemList[30501009] = {impactId=4838}
x300029_g_itemList[30501010] = {impactId=4839}
x300029_g_itemList[30501011] = {impactId=4840}
x300029_g_itemList[30501012] = {impactId=4841}
x300029_g_itemList[30501013] = {impactId=4842}
x300029_g_itemList[30501014] = {impactId=4843}
x300029_g_itemList[30501015] = {impactId=4844}
x300029_g_itemList[30501016] = {impactId=4845}
x300029_g_itemList[30501101] = {impactId=4846}
x300029_g_itemList[30501102] = {impactId=4847}
x300029_g_itemList[30505132] = {impactId=4848}
x300029_g_itemList[30501107] = {impactId=4849}
x300029_g_itemList[30501108] = {impactId=4850}
x300029_g_itemList[30501109] = {impactId=4851}
x300029_g_itemList[30501110] = {impactId=4852}
x300029_g_itemList[30501111] = {impactId=4853}
x300029_g_itemList[30501112] = {impactId=4854}
x300029_g_itemList[30501113] = {impactId=4855}
x300029_g_itemList[30501114] = {impactId=4856}
x300029_g_itemList[30501115] = {impactId=4857}
x300029_g_itemList[30501116] = {impactId=4858}
x300029_g_itemList[30501125] = {impactId=4860}
x300029_g_itemList[30501126] = {impactId=4861}
x300029_g_itemList[30501127] = {impactId=4862}
x300029_g_itemList[30501128] = {impactId=4863}
x300029_g_itemList[30501129] = {impactId=4864}
x300029_g_itemList[30501130] = {impactId=4865}
x300029_g_itemList[30501131] = {impactId=4860}
x300029_g_itemList[30501132] = {impactId=4861}
x300029_g_itemList[30501133] = {impactId=4862}
x300029_g_itemList[30501134] = {impactId=4846}
x300029_g_itemList[30501135] = {impactId=4847}
x300029_g_itemList[30501136] = {impactId=4848}
x300029_g_itemList[30501137] = {impactId=4828}
x300029_g_itemList[30501138] = {impactId=4836}
x300029_g_itemList[30501139] = {impactId=4837}
x300029_g_itemList[30501140] = {impactId=4838}
x300029_g_itemList[30501141] = {impactId=4839}
x300029_g_itemList[30501142] = {impactId=4840}
x300029_g_itemList[30501143] = {impactId=4841}
x300029_g_itemList[30501144] = {impactId=4842}
x300029_g_itemList[30501145] = {impactId=4843}
x300029_g_itemList[30501146] = {impactId=4844}
x300029_g_itemList[30501147] = {impactId=4845}
x300029_g_itemList[30501148] = {impactId=4866}
x300029_g_itemList[30501149] = {impactId=4867}
x300029_g_itemList[30501150] = {impactId=4868}
x300029_g_itemList[30501151] = {impactId=4866}
x300029_g_itemList[30501152] = {impactId=4867}
x300029_g_itemList[30501153] = {impactId=4868}
x300029_g_itemList[30501154] = {impactId=4869}
x300029_g_itemList[30501155] = {impactId=4870}
x300029_g_itemList[30501156] = {impactId=4871}
x300029_g_itemList[30501157] = {impactId=4873}
x300029_g_itemList[30501158] = {impactId=4872}
x300029_g_itemList[30501159] = {impactId=4873}
x300029_g_itemList[30501160] = {impactId=4872}
x300029_g_itemList[30501163] = {impactId=4856}
x300029_g_itemList[30501164] = {impactId=4854}
x300029_g_itemList[30501165] = {impactId=4855}
x300029_g_itemList[30503022] = {impactId=4876} --礼盒变身
x300029_g_itemList[30503023] = {impactId=4877} --玫瑰花变身
x300029_g_itemList[30503024] = {impactId=4878} --兔爷变身

--**********************************
--事件交互入口
--**********************************
function x300029_OnDefaultEvent( sceneId, selfId, bagIndex )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x300029_IsSkillLikeScript( sceneId, selfId)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x300029_CancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x300029_OnConditionCheck( sceneId, selfId )
	--校验使用的物品
	if(1~=LuaFnVerifyUsedItem(sceneId, selfId)) then
		return 0
	end
	
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x300029_g_itemList[itemTblIndex];
	if not itemCur then
		x300029_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
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
function x300029_OnDeplete( sceneId, selfId )
	if(0<LuaFnDepletingUsedItem(sceneId, selfId)) then
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
function x300029_OnActivateOnce( sceneId, selfId )
	local itemTblIndex = LuaFnGetItemIndexOfUsedItem( sceneId, selfId );
	local itemCur = x300029_g_itemList[itemTblIndex];
	if not itemCur then
		x300029_NotifyFailTips(sceneId, selfId, "未开放道具，无法使用。");
		return 0;
	end
	
	if(-1~=itemCur.impactId) then
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, itemCur.impactId, 0);
	end
	return 1;
end

--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x300029_OnActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end

--**********************************
-- 醒目失败提示
--**********************************
function x300029_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

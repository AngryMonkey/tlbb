--脚本号
x892003_g_scriptId = 892003

--**********************************
-- 
--**********************************
function x892003_LevelUp(sceneId, selfId, lwIndex,lw2Index,cailiao)
	x892003_NotifyTip( sceneId, selfId, "Test1:"..lwIndex )
	x892003_NotifyTip( sceneId, selfId, "Test2:"..lw2Index )
	x892003_NotifyTip( sceneId, selfId, "Test3:"..cailiao )
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if lw==10157009 then
		x892003_NotifyTip( sceneId, selfId, "您的龙纹已达到最高级" )
		return
	end
	local lw2 = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lw2Index )
	local icailiao = LuaFnGetItemTableIndexByIndex( sceneId, selfId, cailiao )
	local needCailiao=0
	if x892003_LWCheck( sceneId, selfId, lw )==0 or x892003_LWCheck( sceneId, selfId, lw2 )==0 then
		x892003_NotifyTip( sceneId, selfId, "放入的装备不支持此项操作，请检查" )
		return
	end
	if lw~=lw2 then
		x892003_NotifyTip( sceneId, selfId, "放入的2个龙纹等级不相同" )
		return
	end
	if lw>=10157001 and lw<=10157003 then
		needCailiao=38000152
	elseif lw>=10157004 and lw<=10157006 then
		needCailiao=38000164
	elseif lw>=10157007 and lw<=10157009 then
		needCailiao=38000165
	end
	if icailiao~=needCailiao then
		x892003_NotifyTip( sceneId, selfId, "放入的材料与龙纹的等级不符" )
		return
	end
	local pos = TryRecieveItem( sceneId, selfId, lw+1, 1 )
	if pos==-1 then
		x892003_NotifyTip( sceneId, selfId, "背包空间不足" )
		return
	end
	LuaFnEraseItem( sceneId, selfId, lwIndex )
	LuaFnEraseItem( sceneId, selfId, lw2Index )
	LuaFnEraseItem( sceneId, selfId, cailiao )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	x892003_NotifyTip( sceneId, selfId, "恭喜，龙纹合成成功" )
	local lwLevel=lw-10157000
	local nam = LuaFnGetName( sceneId, selfId )
	if lwLevel>=4 then
		BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[龙纹系统]:#B恭喜玩家 #cff0000"..nam.." #B合成出了 #cff0000"..tonumber(lwLevel+1).." #B级龙纹，大幅提升了龙纹的基本属性。", 4 )
	end
end
--**********************************
-- 
--**********************************
function x892003_StudyProperty(sceneId, selfId, lwIndex)		
	local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 30 )
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if itemIndex~=20310181 and itemIndex~=20310182 and itemIndex~=20310183 then
		x892003_NotifyTip( sceneId, selfId, "材料不符" )
		return
	end
	if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<10 then
		x892003_NotifyTip( sceneId, selfId, "材料不足" )
		return
	end
	if x892003_LWCheck( sceneId, selfId, lw )==0 then
		x892003_NotifyTip( sceneId, selfId, "放入的装备不支持此项操作，请检查" )
		return
	end
	local longwen1 = GetMissionData( sceneId, selfId, MY_LONGWEN1 )
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	if itemIndex==20310181 and longwen1>0 then
		x892003_NotifyTip( sceneId, selfId, "您已学习过此扩展属性，此处无法提升等级。" )
		return
	elseif itemIndex==20310182 and longwen2>0 then
		x892003_NotifyTip( sceneId, selfId, "您已学习过此扩展属性，此处无法提升等级。" )
		return
	elseif itemIndex==20310183 and longwen3>0 then
		x892003_NotifyTip( sceneId, selfId, "您已学习过此扩展属性，此处无法提升等级。" )
		return
	end
	local reply = CostMoney(sceneId,selfId,10000000)
	if reply == -1 then
		x892003_NotifyTip( sceneId, selfId, "金钱不足" )
		return
	end
	local r=random(0,3)
	if itemIndex==20310181 then
		DelItem(sceneId,selfId,itemIndex,10)
		SetMissionData( sceneId, selfId, MY_LONGWEN1, 1 )
	elseif itemIndex==20310182 then
		DelItem(sceneId,selfId,itemIndex,10)
		SetMissionData( sceneId, selfId, MY_LONGWEN2, 1+r*10 )
	elseif itemIndex==20310183 then
		DelItem(sceneId,selfId,itemIndex,10)
		SetMissionData( sceneId, selfId, MY_LONGWEN3, 1+r*10 )
	end
	CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	x892003_NotifyTip( sceneId, selfId, "恭喜，扩展属性学习成功" )
end

function x892003_UpdateProperty(sceneId, selfId, lwIndex)
	local itemIndex = LuaFnGetItemTableIndexByIndex( sceneId, selfId, 30 )
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if x892003_LWCheck( sceneId, selfId, lw )==0 then
		x892003_NotifyTip( sceneId, selfId, "放入的装备不支持此项操作，请检查" )
		return
	end

	if itemIndex~=20310181 and itemIndex~=20310182 and itemIndex~=20310183 then
		x892003_NotifyTip( sceneId, selfId, "材料不符" )
		return
	end
	local longwen1 = GetMissionData( sceneId, selfId, MY_LONGWEN1 )
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	local l2=floor(longwen2/10)
	local l3=floor(longwen3/10)
	longwen2=longwen2-l2*10;
	longwen3=longwen3-l3*10;
	if itemIndex==20310181 and longwen1==0 then
		x892003_NotifyTip( sceneId, selfId, "您没有学习过此扩展属性。" )
		return
	elseif itemIndex==20310182 and longwen2==0 then
		x892003_NotifyTip( sceneId, selfId, "您没有学习过此扩展属性或已是最大级。" )
		return
	elseif itemIndex==20310183 and longwen3==0 then
		x892003_NotifyTip( sceneId, selfId, "您没有学习过此扩展属性或已是最大级。" )
		return
	end
	if itemIndex==20310181 then
		if longwen1==10 then
			x892003_NotifyTip( sceneId, selfId, "此扩展属性已提升至最大等级" )
			return
		end
		if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<(longwen1+1)*10 then
			x892003_NotifyTip( sceneId, selfId, "材料不足:从 "..longwen1.." 级提升至 "..tonumber(longwen1+1).." 级需要材料 "..tonumber((longwen1+1)*10).." 个" )
		else
			local reply = CostMoney(sceneId,selfId,50000000)
			if reply == -1 then
				x892003_NotifyTip( sceneId, selfId, "金钱不足" )
				return
			end
			DelItem(sceneId,selfId,itemIndex,(longwen1+1)*10)
			SetMissionData( sceneId, selfId, MY_LONGWEN1, longwen1+1 )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
			local	nam	= LuaFnGetName( sceneId, selfId )
			if longwen1==4 then
				BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[龙纹系统]:#Y恭喜玩家 #G"..nam.." #Y将他的#B龙纹#Y的扩展属性[#G血上限#Y]提升至#cff0000"..tonumber(longwen1+1).."级，大幅提升了#G龙纹#Y的属性。", 4 )
			end
			x892003_NotifyTip( sceneId, selfId, "恭喜，扩展属性升级成功" )
			CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
		end
		return
	elseif itemIndex==20310182 then
		if longwen2==0 then
			x892003_NotifyTip( sceneId, selfId, "还没学习此扩展属性已提升至最大等级" )
			return
		end
		if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<(longwen2+1)*10 then
			x892003_NotifyTip( sceneId, selfId, "材料不足:从 "..longwen2.." 级提升至 "..tonumber(longwen2+1).." 级需要材料 "..tonumber((longwen2+1)*10).." 个" )
		else
			local reply = CostMoney(sceneId,selfId,50000000)
			if reply == -1 then
				x892003_NotifyTip( sceneId, selfId, "金钱不足" )
				return
			end
			DelItem(sceneId,selfId,itemIndex,(longwen2+1)*10)
			SetMissionData( sceneId, selfId, MY_LONGWEN2, longwen2+1+l2*10 )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
			if longwen2==4 then
				BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[龙纹系统]:#Y恭喜玩家 #G"..nam.." #Y将他的#B龙纹#Y的扩展属性[#G降低目标抗性#Y]提升至#cff0000"..tonumber(longwen2+1).."级，大幅提升了#G龙纹#Y的属性。", 4 )
			end
			x892003_NotifyTip( sceneId, selfId, "恭喜，扩展属性升级成功" )
			CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
		end
		return
	elseif itemIndex==20310183 then
		if longwen3==10 then
			x892003_NotifyTip( sceneId, selfId, "此扩展属性已提升至最大等级" )
			return
		end
		if LuaFnGetAvailableItemCount(sceneId, selfId, itemIndex)<(longwen3+1)*10 then
			x892003_NotifyTip( sceneId, selfId, "材料不足:从 "..longwen3.." 级提升至 "..tonumber(longwen3+1).." 级需要材料 "..tonumber((longwen3+1)*10).." 个" )
		else
			local reply = CostMoney(sceneId,selfId,50000000)
			if reply == -1 then
				x892003_NotifyTip( sceneId, selfId, "金钱不足" )
				return
			end
			DelItem(sceneId,selfId,itemIndex,(longwen3+1)*10)
			SetMissionData( sceneId, selfId, MY_LONGWEN3, longwen3+1+l3*10 )
			LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
			if longwen3==4 then
				BroadMsgByChatPipe( sceneId, selfId, "#cff66cc[龙纹系统]:#Y恭喜玩家 #G"..nam.." #Y将他的#B龙纹#Y的扩展属性[#G属性攻击#Y]提升至#cff0000"..tonumber(longwen3+1).."级，大幅提升了#G龙纹#Y的属性。", 4 )
			end
			x892003_NotifyTip( sceneId, selfId, "恭喜，扩展属性升级成功" )
			CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
		end
		return
	end	
end

function x892003_ResetProperty(sceneId, selfId, lwIndex)
	if LuaFnGetAvailableItemCount(sceneId, selfId, 20310180)<1 then
		x892003_NotifyTip( sceneId, selfId, "缺少净云水" )
		return
	end
	local lw = LuaFnGetItemTableIndexByIndex( sceneId, selfId, lwIndex )
	if x892003_LWCheck( sceneId, selfId, lw )==0 then
		x892003_NotifyTip( sceneId, selfId, "放入的装备不支持此项操作，请检查" )
		return
	end
	local longwen2 = GetMissionData( sceneId, selfId, MY_LONGWEN2 )
	local longwen3 = GetMissionData( sceneId, selfId, MY_LONGWEN3 )
	local l2=floor(longwen2/10)
	local l3=floor(longwen3/10)
	longwen2=longwen2-l2*10;
	longwen3=longwen3-l3*10;
	local r2=random(0,3)
	longwen2=longwen2+r2*10
	local r3=random(0,3)
	longwen3=longwen3+r3*10
	local reply = CostMoney(sceneId,selfId,10000000)
	if reply == -1 then
		x892003_NotifyTip( sceneId, selfId, "金钱不足" )
		return
	end

	DelItem(sceneId,selfId,20310180,1)
	SetMissionData( sceneId, selfId, MY_LONGWEN2, longwen2 )
	SetMissionData( sceneId, selfId, MY_LONGWEN3, longwen3 )
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 152, 0)
	x892003_NotifyTip( sceneId, selfId, "恭喜，龙纹更换扩展属性成功" )
	CallScriptFunction( 892001, "GetLWInfo", sceneId, selfId )
end

--**********************************
--龙纹检查
--**********************************
function x892003_LWCheck( sceneId, selfId, index )
	x892003_NotifyTip( sceneId, selfId, "Test:"..index )
	local flag=0
	if index>=10157001 and index<=10157010 then
		flag=1
	end
	return flag
end

--**********************************
--醒目提示
--**********************************
function x892003_NotifyTip( sceneId, selfId, Msg )
	BeginEvent( sceneId )
		AddText( sceneId, Msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--对话窗口信息提示
--**********************************
function x892003_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
end

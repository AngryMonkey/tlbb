-- 新坐骑

-- 脚本号
x210512_g_ScriptId	= 210512   
x210512_g_ItemId = 30005017        

--**********************************
-- 事件交互入口
--**********************************
function x210512_OnDefaultEvent( sceneId, selfId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "#b#Y 对 不 起 你 的 级 别 不 足#G 10 #W 级，请#G 10#W 级 后 再使 用#G【神符】 " )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end
	SetPrescription( sceneId, selfId, 456, 1 )
       SetPrescription( sceneId, selfId, 562, 1 )
       SetPrescription( sceneId, selfId, 464, 1 )
       SetPrescription( sceneId, selfId, 459, 1 )
       SetPrescription( sceneId, selfId, 460, 1 )
       SetPrescription( sceneId, selfId, 461, 1 )
       SetPrescription( sceneId, selfId, 457, 1 )
       SetPrescription( sceneId, selfId, 463, 1 )
       SetPrescription( sceneId, selfId, 462, 1 )
        --AddSkill(  sceneId, selfId, 456)
	 --AddSkill(  sceneId, selfId, 562)
	 --AddSkill(  sceneId, selfId, 464)
	 --AddSkill(  sceneId, selfId, 459)
	 --AddSkill(  sceneId, selfId, 460)
	 --AddSkill(  sceneId, selfId, 461)
	 --AddSkill(  sceneId, selfId, 457)
	 --AddSkill(  sceneId, selfId, 463)
	 --AddSkill(  sceneId, selfId, 462)
        LuaFnDelAvailableItem(sceneId,selfId,x210512_g_ItemId,1)
        --local	nam	= LuaFnGetName( sceneId, selfId )
	--BroadMsgByChatPipe( sceneId, selfId, "#gff00f0恭喜玩家#gffff00"..nam.."#gff00f0成功学会了所有技能！", 4 )
	BeginEvent(sceneId)
		AddText(sceneId,"#b#Y 恭喜您学会了所有门派60级骑术技能！")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
	
end

--**********************************
-- 
--**********************************
function x210512_IsSkillLikeScript( sceneId, selfId)
	return 0
end

-- ������

-- �ű���
x210512_g_ScriptId	= 210512   
x210512_g_ItemId = 30005017        

--**********************************
-- �¼��������
--**********************************
function x210512_OnDefaultEvent( sceneId, selfId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "#b#Y �� �� �� �� �� �� �� �� ��#G 10 #W ������#G 10#W �� �� ��ʹ ��#G������� " )
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
	--BroadMsgByChatPipe( sceneId, selfId, "#gff00f0��ϲ���#gffff00"..nam.."#gff00f0�ɹ�ѧ�������м��ܣ�", 4 )
	BeginEvent(sceneId)
		AddText(sceneId,"#b#Y ��ϲ��ѧ������������60���������ܣ�")
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, -1 )
	
end

--**********************************
-- 
--**********************************
function x210512_IsSkillLikeScript( sceneId, selfId)
	return 0
end

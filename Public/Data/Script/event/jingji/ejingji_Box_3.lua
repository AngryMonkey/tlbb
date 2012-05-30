-- 125024 ����
-- ��ȡbuff�ı���

x125024_g_scriptId = 125024

--**********************************
--���⽻��:�����ж�
--**********************************
function x125024_OnActivateConditionCheck( sceneId, selfId, activatorId )
	-- �������ϵ�buff
	local bOk = CallScriptFunction((125022), "IsCanOpenBox",sceneId,activatorId )

	if bOk == 0  then
	  BeginEvent(sceneId)
	    AddText(sceneId,"�����ڲ��ܿ���������䡣");
	  EndEvent(sceneId)
	  DispatchMissionTips(sceneId,activatorId,selfId)
		
	end
	
	if GetUnitCampID(sceneId, activatorId, activatorId) < 10   then
    BeginEvent(sceneId)
      AddText(sceneId,"�����ڵ�ս����Ӫ����ȷ�����ܿ������䡣");
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,activatorId,selfId)
		bOk = 0
	end
	
	return bOk
end

--**********************************
--���⽻��:���ĺͿ۳�����
--**********************************
function x125024_OnActivateDeplete( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ɹ���Ч����
--**********************************
function x125024_OnActivateEffectOnce( sceneId, selfId, activatorId )
	
	-- �������Npc�����������+buff��
	-- selfId == ����Id
	-- activatorId == ������Id
	
	local x
	local z
	x,z = GetWorldPos(sceneId, selfId)
	LuaFnDeleteMonster(sceneId, selfId)
	
	-- �������ɹ������һ�������
	local nItemId = 40004434

	local nBoxId = DropBoxEnterScene(	x,z,sceneId )
	if nBoxId > -1  then
		AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS,1,nItemId)

		-- ���������󶨸��ƶ����
		SetItemBoxOwner(sceneId, nBoxId, LuaFnGetGUID(sceneId,activatorId))
	end
	
	return 1
end

--**********************************
--���⽻��:������ÿʱ������Ч����
--**********************************
function x125024_OnActivateEffectEachTick( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:������ʼʱ�����⴦��
--**********************************
function x125024_OnActivateActionStart( sceneId, selfId, activatorId )
	return 1
end

--**********************************
--���⽻��:��������ʱ�����⴦��
--**********************************
function x125024_OnActivateCancel( sceneId, selfId, activatorId )
	return 0
end

--**********************************
--���⽻��:�����ж�ʱ�����⴦��
--**********************************
function x125024_OnActivateInterrupt( sceneId, selfId, activatorId )
	return 0
end

function x125024_OnActivateInterrupt( sceneId, selfId, activatorId )

end


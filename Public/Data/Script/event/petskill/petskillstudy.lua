--���޼���ѧϰUI 3

x311111_g_ScriptId = 311111;

x311111_g_MenPaiId = 0;
x311111_g_MenPaiSkillIds = {701,702,703}

--**********************************
--�о��¼�
--**********************************
function x311111_OnEnumerate( sceneId, selfId, targetId, sel )
	if(sel == 6) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId); --���÷���������Ϣ����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 5)
		
		local ret = DispatchPetPlacardList(sceneId,selfId,targetId,-1,-1,1);
		if(0 == ret) then
			Msg2Player( sceneId,selfId,"����û��ע�������",MSG2PLAYER_PARA)
		end
	elseif (sel == 1) then
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);	--�����°����޼���ѧϰ���� UI 223
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 223)
	else
		BeginUICommand(sceneId)
			UICommand_AddInt(sceneId,targetId);
			UICommand_AddInt(sceneId,sel)		--���ü���ѧϰ����
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 3)
	end
end

--������飬����0 ���ʧ�� ,1 ���ɹ�
function x311111_PetSkillStudy_MenPaiCheck(sceneId, selfId)
	if(x311111_g_MenPaiId ~= tonumber(GetMenPai(sceneId, selfId))) then
		return 0;
	else
		return 1;
	end
end

--���ɼ���ѧϰ
function x311111_PetSkillStudy_MenPai_Learn(sceneId, selfId, petHid, petLid, skillId)
	local ret = PetStudySkill_MenPai(sceneId, selfId, petHid, petLid, skillId);
	if( 1 == ret ) then
		Msg2Player( sceneId,selfId,"�������ɼ���ѧϰ�ɹ�",MSG2PLAYER_PARA)
	else
		Msg2Player( sceneId,selfId,"�������ɼ���ѧϰʧ��",MSG2PLAYER_PARA)
	end
end

--ѱ���Ѳ�ѯ
function x311111_PetSkillStudy_Ask_Money(sceneId, selfId, petHid, petLid)
	local money	= x311111_CalcMoney_ha( sceneId, selfId, petHid, petLid )
	BeginUICommand(sceneId)
		UICommand_AddInt(sceneId, money)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 4)
end

--ѱ������
function x311111_PetSkillStudy_Domestication(sceneId, selfId, petHid, petLid)
--local ret = PetDomestication(sceneId, selfId, petHid, petLid);
	local checkAvailable = LuaFnIsPetAvailableByGUIDNoPW(sceneId, selfId, petHid, petLid);
	if checkAvailable and checkAvailable == 1 then
		local money	= x311111_CalcMoney_ha( sceneId, selfId, petHid, petLid )
		local PlayerMoney = GetMoney( sceneId, selfId )  +  GetMoneyJZ(sceneId, selfId)  --�����ռ� Vega
		if PlayerMoney < money then
			return
		end
		--����ҵ������������ֶȲ�ɾ����Ǯ
		LuaFnCostMoneyWithPriority( sceneId, selfId, money )
		LuaFnSetPetHappiness( sceneId, selfId, petHid, petLid, 100 )
		Msg2Player( sceneId, selfId, "����ѱ���ɹ�", MSG2PLAYER_PARA )
	else
		Msg2Player( sceneId, selfId, "�����ڽ���״̬���иò���", MSG2PLAYER_PARA )
	end
end

--�鿴ǰһƪ������Ϣ
function x311111_PetInviteFriend_Ask_NewPage(sceneId, selfId, npcId, guid1, guid2, dir)
	local ret = DispatchPetPlacardList(sceneId, selfId, npcId, guid1, guid2, dir)
	if(0 == ret) then
		Msg2Player( sceneId,selfId,"û�и���������",MSG2PLAYER_PARA)
	end
end

--**********************************
--����ָ����ֶȷ���
--**********************************
--��λѪѱ����ֵ��0.025+n*0.0005��nΪ���޵ȼ���
--��λ���ֶȼ�ֵ��0.373+0.44*n��nΪ���޵ȼ���
function x311111_CalcMoney_ha( sceneId, selfId, petHid, petLid )
	local lv	= LuaFnGetPetLevelByGUID( sceneId, selfId, petHid, petLid )
	local	ha	= 100 - LuaFnGetPetHappiness( sceneId, selfId, petHid, petLid )
	if ha <= 0 then
		return 0
	end

	local	gld	= floor( ( 0.373+lv*0.44 ) * ha )
	if gld < 1 then
		gld			= 1
	end
	return gld
end

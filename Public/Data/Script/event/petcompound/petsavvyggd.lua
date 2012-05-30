-- ������������

-- �ű���
x800106_g_ScriptId = 800106

-- NPC ����
x800106_g_Name = "������"

	
--**********************************
-- ������ں���
--**********************************
function x800106_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	if GetName( sceneId, targetId ) ~= x800106_g_Name then		--�жϸ� npc �Ƿ���ָ����npc
		return
	end

	BeginUICommand( sceneId )
		UICommand_AddInt( sceneId, targetId )
	EndUICommand( sceneId )
	DispatchUICommand( sceneId, selfId, 19820425 )
end

--**********************************
-- �о��¼�
--**********************************
function x800106_OnEnumerate( sceneId, selfId, targetId )
	if GetName( sceneId, targetId ) ~= x800106_g_Name then		--�жϸ� npc �Ƿ���ָ����npc
		return
	end

	AddNumText( sceneId, x800106_g_ScriptId, "ʹ�ø��ǵ���������" ,6,-1)
end


--**********************************
-- ������������
--**********************************
function x800106_PetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	
	local	SelfMoney = GetMoney(sceneId, selfId)
	
	local gengu = LuaFnGetPetGenGuByGUID(sceneId, selfId, mainPetGuidH, mainPetGuidL)
	local savvy = GetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL )
	if savvy == 10 then
		x800106_NotifyTip(sceneId, selfId, "�����Ѿ�����ߣ�������������" );
		return 0;
	end
	local cost = GetCostOfGenGuBySavvy(sceneId, selfId, savvy);
	local succRate = GetSuccrateOfGenGuBySavvy(sceneId, selfId, savvy);
	local rand = random(1000)
	
	--��� ���� ��
	local nSavvyNeed = savvy+1;	
	local nItemIdGenGuDan = 0;
	local msgTemp;
	if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
		msgTemp = "��";
		nItemIdGenGuDan = 30504038;
	elseif nSavvyNeed >= 4 and nSavvyNeed <= 6 then
		msgTemp = "��"
		nItemIdGenGuDan = 30502001;
	elseif nSavvyNeed >= 7 and nSavvyNeed <= 10 then
		msgTemp = "��"
		nItemIdGenGuDan = 30502002;
	end
	
	local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
	if nYaoDingCount <= 0 then
		if nSavvyNeed >= 1 and nSavvyNeed <= 3 then
			--û�а󶨵ĵͼ����ǵ�
			nItemIdGenGuDan = 30502000
			local nYaoDingCount = GetItemCount(sceneId, selfId, nItemIdGenGuDan);
			if nYaoDingCount<= 0 then
				local msg = format("�������������Ե�%d��Ҫ%s�����ǵ���", savvy+1, msgTemp )
				x800106_NotifyTip(sceneId, selfId, msg );
				return 0;
			end
		else
			local msg = format("�������������Ե�%d��Ҫ%s�����ǵ���", savvy+1, msgTemp )
			x800106_NotifyTip(sceneId, selfId, msg );
			return 0;
		end
	end
	local	SelfMoney = GetMoney(sceneId, selfId)  +  GetMoneyJZ(sceneId, selfId);   --�����ռ� Vega
	if SelfMoney < cost then 
		return 0;
	end
	
	--ɾ������ ��
	local bRet = DelItem(sceneId, selfId, nItemIdGenGuDan, 1)
	
	if bRet<=0 then
		local msg = format("ɾ������ʧ�ܣ�");
		x800106_NotifyTip(sceneId, selfId, msg );		
		return 0;
	end
	
	local costRet = LuaFnCostMoneyWithPriority(sceneId,selfId,cost)
	if costRet < 0 then
		return 0;
	end
		
	if rand > succRate then
		
		local nSavvyDown = GetLeveldownOfCompoundBySavvy( sceneId,selfId, savvy );
		if nSavvyDown > savvy then
			nSavvyDown = savvy;	
		end
		
		SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, savvy - nSavvyDown );
		
		Audit_PetImproveWuxing( sceneId, selfId, mainPetGuidH, mainPetGuidL, 0, savvy - nSavvyDown );
		
		local msg = format("�ϳ�ʧ�ܣ�Ŀǰ���޵�����Ϊ%d", savvy - nSavvyDown );
		x800106_NotifyTip(sceneId, selfId, msg );
		return 0;
	end
	
	SetPetSavvy( sceneId, selfId, mainPetGuidH, mainPetGuidL, nSavvyNeed )
	
	Audit_PetImproveWuxing( sceneId, selfId, mainPetGuidH, mainPetGuidL, 1, nSavvyNeed );
	
	local szPlayerName, szPetTransString;
	
	szPetTransString = GetPetTransString(  sceneId, selfId, mainPetGuidH, mainPetGuidL );
	szPlayerName = GetName( sceneId, selfId );
	
	local msg = format("��ϲ�����ϳɳɹ��������������ԣ�1��");
	x800106_NotifyTip(sceneId, selfId, msg );

	--���澫������������7�����ϲŹ���
	if nSavvyNeed >= 7 then
		
		local szMsg;
		szMsg = format("#{_INFOUSR%s}#{ZW_1}#{_INFOMSG%s}#{ZW_2}%d#{ZW_3}",szPlayerName, szPetTransString, nSavvyNeed );
		
		AddGlobalCountNews( sceneId, szMsg );
	
	end
	
	--�ɹ��Ĺ�Ч
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0);
		
end


--**********************************
--��Ŀ��ʾ
--**********************************
function x800106_NotifyTip( sceneId, selfId, msg )

	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )

end

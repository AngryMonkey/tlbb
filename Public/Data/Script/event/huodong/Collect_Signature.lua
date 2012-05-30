--Creator ��ΰ
--�ռ�ǩ��
----------------
--MisDescBegin
--�ű���
x808038_g_ScriptId = 808038;
--��������NPC����
x808038_g_Position_X=170.5004
x808038_g_Position_Z=122.5593

x808038_g_AccomplishNPC_Name="������"

--�����
x808038_g_MissionId = 1130;

--����Ŀ��npc
x808038_g_Name 					= "������"
--�������
x808038_g_MissionKind			= 13 --����
--����ȼ�
x808038_g_MissionLevel		= 10000
--�Ƿ��Ǿ�Ӣ����
x808038_g_IfMissionElite	= 0
--�����Ƿ��Ѿ����
x808038_g_IsMissionOkFail	= 0		--��������ĵ�0λ

--�����ı�����
x808038_g_MissionName			= "�ռ�ǩ��"
--��������
x808038_g_MissionInfo			= "�ռ�15������ǩ�����������ƴ���ȡ������"
--����Ŀ��
x808038_g_MissionTarget		= "#{SJQM_8825_20}"
--δ��������npc�Ի�
x808038_g_ContinueInfo		= "�����㻹û����ɰ���"
--�������npc˵�Ļ�
x808038_g_MissionComplete	= "���ĺܺã�"

x808038_g_city 				 	= 1		 --��������ĵ�1λ

-- ����������,���ݶ�̬ˢ��,ռ����������ĵ�1λ

x808038_g_Custom	= { {id="�Ѿ��ռ�����ǩ��",num=15} }
--MisDescEnd
----------------

--ǩ��¼����ID
x808038_g_SignatureList_id = 40004451; 
--ǩ������ID
x808038_g_Signature_id = 40004452; 
--���������ID
x808038_g_Gift_id = 30008052; 
--�һ�������ЧID
x808038_g_Impact_id = 47;
--���齱��ֵ
x808038_g_Exp_Prize = 
{
18308,19336,20337,21344,22392,23412,24437,25505,26543,27624,  										-- 10->19
56219,58703,61269,63851,66448,68992,71619,74262,76921,79526,											-- 20->29
132458,136815,141197,145491,149923,154380,158861,163253,167784,172339,						-- 30->39
258033,264744,271376,278159,284979,291718,298610,305538,312384,319384,						-- 40->49
326421,333374,340483,347628,354809,361905,369159,376448,383652,391013,						-- 50->59
398411,405722,413192,420699,428117,435695,443310,450835,458522,466245,						-- 60->69
474004,481673,489504,497371,505147,513087,521063,528946,536994,545078,						-- 70->79
553069,561225,569418,577647,585780,594081,602418,610659,619069,627514,						-- 80->89
635862,644380,652934,661390,670016,678678,687241,695975,704745,713552,						-- 90->99
722258,731000,739915,748866,757714,766738,775797,784753,793885,803052,						-- 100->109
812116,821356,830632,839802,849151,858535,867813,877269,886762,896148,						-- 110->119
905712,915314,924806,934479,944189,953789,963570,973388,983242,992985,						-- 120->129
1002911,1012874,1022724,1032759,1042829,1052787,1062930,1073109,1083174,1093425,	-- 130->139
1103713,1113885,1124244,1134640,1144920,1155387,1165892,1176278,1186855,1197467,	-- 140->149
1207961,
}
 
--**********************************
--������ں���
--**********************************
function x808038_OnDefaultEvent( sceneId, selfId, targetId )
	local id = GetNumText();
	if id == 1 then 
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_02}");	
			AddNumText(sceneId, x808038_g_ScriptId, "�μ��ռ�ǩ���", 6, 3);
			AddNumText(sceneId, x808038_g_ScriptId, "�һ�����", 6, 4);
			EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 2 then --����
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_08}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
	elseif id == 3 then --�μӻ
		-- �ȼ�>10?
		local lvl = GetLevel(sceneId, selfId);
		if lvl < 10 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_03}");
			return
		end
		-- �ѽ�ǩ������
		if IsHaveMission(sceneId, selfId, x808038_g_MissionId) > 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_04}");
			return		
		end
		-- ����������
		if IsMissionFull(sceneId, selfId) == 1 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_05}");
			return			
		end
		-- �����������пռ䣿
		if LuaFnGetTaskItemBagSpace(sceneId, selfId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_06}");
			return		
		end
		-- �յ�����
		local ret = AddMission( sceneId,selfId, x808038_g_MissionId, x808038_g_ScriptId, 0, 0, 0 );
		if ret < 1 then
			return
		end	
		-- �������㣬��ǩ��¼����
		ret = TryRecieveItem( sceneId, selfId, x808038_g_SignatureList_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			return  -- ������ʧ��	
		end	
		--��־
		AuditJoinCollectSignature(sceneId, selfId);
		-- ������Ϣ
		BeginEvent(sceneId, selfId)
			AddText(sceneId, "#{SJQM_8815_07}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);	
	elseif id == 4 then
		-- ���ܶҽ�����
		local weekTime = GetWeekTime();
		local diJiTian = GetTodayWeek();
		if diJiTian == 0 then  -- ����һ��Ϊһ�ܿ�ʼ
			weekTime = weekTime - 1;
		end
		if GetMissionData(sceneId, selfId, MD_SIGNATURE_GETPRIZE_TIME) == weekTime then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_16}");
			return					
		end
		-- �μӻ����
		if IsHaveMission(sceneId, selfId, x808038_g_MissionId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_17}");
			return		
		end
		-- ��15��ǩ������
		if GetItemCount(sceneId, selfId, x808038_g_Signature_id) < 15 then
		  x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8815_18}");
		  return
		end
		-- ������
		if LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_Signature_id) < 15 then
		  x808038_ReturnMsg(sceneId, selfId, targetId, "#{ResultText_158}");
		  return			
		end
		-- �����������пռ䣿
		if LuaFnGetPropertyBagSpace(sceneId, selfId) == 0 then
			x808038_ReturnMsg(sceneId, selfId, targetId, "#{SJQM_8819_20}");
			return		
		end
		--�۳�ǩ��
		if LuaFnDelAvailableItem(sceneId, selfId, x808038_g_Signature_id, 15) == 0 then
			x808038_ShowMsg(sceneId, selfId, "�۳�ǩ��ʧ�ܣ�");
		  return
		end
		--�۳�ǩ����
		if LuaFnDelAvailableItem(sceneId, selfId, x808038_g_SignatureList_id, 1) == 0 then
			x808038_ShowMsg(sceneId, selfId, "�۳�ǩ��¼ʧ�ܣ�");
		  return
		end		
		-- ��������
		local lvl = GetLevel(sceneId, selfId);
		if lvl > 9 and lvl < 119 then
			LuaFnAddExp(sceneId, selfId, x808038_g_Exp_Prize[lvl-9]);
		end
		-- �������
		ret = TryRecieveItem( sceneId, selfId, x808038_g_Gift_id, QUALITY_MUST_BE_CHANGE);
		if ret == -1 then
			x808038_ShowMsg(sceneId, selfId, "����ʧ�ܣ�");		
			return  -- ����ʧ��	
		end
		-- ������Ч
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, x808038_g_Impact_id, 0);
		-- ���öҽ�ʱ��
		SetMissionData(sceneId, selfId, MD_SIGNATURE_GETPRIZE_TIME, weekTime);
		-- ɾ������
		DelMission(sceneId, selfId, x808038_g_MissionId);

		-- ������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, "#{SJQM_8815_19}");
		EndEvent()
		DispatchEventList(sceneId, selfId, targetId);
		-- �㲥
		local playerName = GetName(sceneId, selfId);
		if playerName ~= nil then
			str = format("#{_INFOUSR%s}#{SJQM_8815_01}", playerName); 
			AddGlobalCountNews( sceneId, str )
		end		
	end
end

--**********************************
--�о��¼�
--**********************************
function x808038_OnEnumerate( sceneId, selfId, targetId )	
	AddNumText(sceneId, x808038_g_ScriptId, "�ռ�ǩ���", 6, 1);
	AddNumText(sceneId, x808038_g_ScriptId, "�ռ�ǩ�������", 0, 2);
end

--**********************************
--�������������������
--**********************************
function x808038_OnAbandon( sceneId, selfId )
	local itemNum = LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_SignatureList_id);
	local itemNum2 = LuaFnGetAvailableItemCount(sceneId, selfId, x808038_g_Signature_id);
	if itemNum >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x808038_g_SignatureList_id, itemNum );
	end
	if itemNum2 >= 1 then
		LuaFnDelAvailableItem( sceneId, selfId, x808038_g_Signature_id, itemNum2 );
	end
  if IsHaveMission(sceneId, selfId, x808038_g_MissionId) > 0 then
  	DelMission( sceneId, selfId, x808038_g_MissionId )
  end
  return 0;
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x808038_ShowMsg( sceneId, selfId, msg )
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchMissionTips(sceneId, selfId);
end

--**********************************
--NPC������Ϣ
--**********************************

function x808038_ReturnMsg(sceneId, selfId, targetId, msg)
	BeginEvent(sceneId)
		AddText(sceneId, msg);
	EndEvent()
	DispatchEventList(sceneId, selfId, targetId);
end

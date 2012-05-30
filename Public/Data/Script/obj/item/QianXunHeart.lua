-- Ѱ·֮�� ItemID 40004435

-- �ű���
x300085_g_scriptId = 300085

x300085_g_event = 229024				-- ǧѰ����ű�
--�����
x300085_g_MissionId			= 421

--������
x300085_g_Mission_RoundNum	 = 5		--��5λ����

x300085_g_FuQiMission_IDX		 	= 131	--���޹�ϵ��������
x300085_g_JieBaiMission_IDX		= 132	--��ݹ�ϵ��������
x300085_g_ShiTuMission_IDX		= 133	--ʦͽ��ϵ��������

x300085_g_scenePosInfoList = { {sceneId=7,  scenename="����", PosName="���ŵ���", PosX=130, PosY=140,  PosR=10, Area=711 },
															 {sceneId=8,  scenename="�ػ�", PosName="嫺����", PosX=267, PosY=251,  PosR=10, Area=811 },
															 {sceneId=5,  scenename="����", PosName="����ٷ�", PosX=35 , PosY=265,  PosR=10, Area=511 },
															 {sceneId=4,  scenename="̫��", PosName="��鿸�̨", PosX=155, PosY=255,  PosR=10, Area=411 },
															 {sceneId=3,  scenename="��ɽ", PosName="��ɽ�ཿ", PosX=280, PosY=80,   PosR=10, Area=311 },
															 {sceneId=30, scenename="����", PosName="һ������", PosX=170, PosY=230,  PosR=10, Area=3011},															 
															 {sceneId=31, scenename="��Ȫ", PosName="����ֱ��", PosX=270, PosY=280,  PosR=10, Area=3111},
															 {sceneId=25, scenename="��ɽ", PosName="��ˮ����", PosX=260, PosY=110,  PosR=10, Area=2512},															 
															 {sceneId=32, scenename="����", PosName="��������", PosX=50 , PosY=180,  PosR=10, Area=3211},															 
															 {sceneId=0,  scenename="����", PosName="�������", PosX=50,  PosY=220,  PosR=10, Area=11  } }

--**********************************
--�¼��������
--**********************************
function x300085_OnDefaultEvent( sceneId, selfId, bagIndex )
-- ����Ҫ����ӿڣ���Ҫ�����պ���
end


--**********************************
--�����Ʒ��ʹ�ù����Ƿ������ڼ��ܣ�
--ϵͳ����ִ�п�ʼʱ�����������ķ���ֵ���������ʧ������Ժ�������Ƽ��ܵ�ִ�С�
--����1���������Ƶ���Ʒ�����Լ������Ƽ��ܵ�ִ�У�����0�����Ժ���Ĳ�����
--**********************************
function x300085_IsSkillLikeScript( sceneId, selfId )
	return 1	 --����ű���Ҫ����֧��
end


--**********************************
--ֱ��ȡ��Ч����
--ϵͳ��ֱ�ӵ�������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���Ѿ�ȡ����ӦЧ��������ִ�к�������������0��û�м�⵽���Ч��������ִ�С�
--**********************************
function x300085_CancelImpacts( sceneId, selfId )
	return 0	 --����Ҫ����ӿڣ���Ҫ�����պ���,����ʼ�շ���0��
end

--**********************************
--��������������ڣ�
--�������ܻ���ÿ����������ʱ��������ӿڡ�
--���أ�1�����´�������0���ж�������
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300085_OnActivateEachTick( sceneId, selfId )
	return 1	 --���������Խű�, ֻ�����պ�����
end


--**********************************
--��Ϣ��ʾ
--**********************************
function x300085_MsgBox( sceneId, selfId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--���������ڣ�
--ϵͳ���ڼ��ܼ���ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1���������ͨ�������Լ���ִ�У�����0���������ʧ�ܣ��жϺ���ִ�С�
--**********************************
function x300085_OnConditionCheck( sceneId, selfId )
	
	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	--У��ʹ�õ���Ʒ
	if( 1 ~= LuaFnVerifyUsedItem( sceneId, selfId ) ) then
		return 0
	end
	
	--�����Ʒ�Ƿ����
	if LuaFnLockCheck( sceneId, selfId, bagId, 0 ) < 0 then
		x300085_MsgBox( sceneId, selfId, "����Ʒ�ѱ�������" )
		return 0
	end

	if IsHaveMission( sceneId, selfId, x300085_g_MissionId ) <= 0 then
		return 0
	end

	local misIndex = GetMissionIndexByID(sceneId,selfId,x300085_g_MissionId)
	local nRoundNum = GetMissionParam(sceneId, selfId, misIndex, x300085_g_Mission_RoundNum)
	local ScintInfo = x300085_g_scenePosInfoList[nRoundNum]
	
	--ȡ����ҵ�ǰ����
	local PlayerX = GetHumanWorldX(sceneId,selfId)
	local PlayerY = GetHumanWorldZ(sceneId,selfId)
	--���������Ŀ���ľ���
	local Distance = floor(sqrt((ScintInfo.PosX-PlayerX)*(ScintInfo.PosX-PlayerX)+(ScintInfo.PosY-PlayerY)*(ScintInfo.PosY-PlayerY)))
	local str = format("ǧѰ�����%d��: ȥ#G%s#W̽��#G%s#{_INFOAIM%d,%d,%d,%s}#W��һ�����������ɡ��ִ����ʹ��#YѰ·֮��#W��", nRoundNum, ScintInfo.scenename, ScintInfo.PosName, ScintInfo.PosX, ScintInfo.PosY, ScintInfo.sceneId, ScintInfo.scenename)		
	if sceneId ~= ScintInfo.sceneId then
		BeginEvent(sceneId)
			AddText(sceneId, str)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
		return 0
	end
	
	--PrintStr("Distance=" .. Distance)

	if Distance > ScintInfo.PosR then
		BeginEvent(sceneId)
			AddText(sceneId,str)
			AddText(sceneId,"����ʩ��Ѱ·֮�ĵĵط�����"..Distance.."��")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,-1)
	
	elseif Distance <= ScintInfo.PosR then  		
 		local	nMisType = GetMissionData( sceneId, selfId, MD_QIANXUN_SELECT_MISSIONTYPE )	--��Ա��ѡ����������
		-- ��֤�����ϵ��ҲҪ�ڸ���
		if nMisType == x300085_g_FuQiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_FuQi",sceneId, selfId) == 0 then
				return 0
			end
		elseif nMisType == x300085_g_JieBaiMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_JieBai",sceneId, selfId) == 0 then			
				return 0
			end
		elseif nMisType == x300085_g_ShiTuMission_IDX then
			if CallScriptFunction(x300085_g_event,"CheckMission_ShiTu",sceneId, selfId) == 0 then			
				return 0
			end
		else		
			x300085_NotifyTip( sceneId, selfId, "ʹ����Ʒʧ��" )		
			return 0
		end  		
 		 		
 		return 1		
	end
	
	return 0
end

--**********************************
--���ļ�⼰������ڣ�
--ϵͳ���ڼ������ĵ�ʱ����������ӿڣ���������������ķ���ֵȷ���Ժ�������Ƿ�ִ�С�
--����1�����Ĵ���ͨ�������Լ���ִ�У�����0�����ļ��ʧ�ܣ��жϺ���ִ�С�
--ע�⣺�ⲻ�⸺�����ĵļ��Ҳ�������ĵ�ִ�С�
--**********************************
function x300085_OnDeplete( sceneId, selfId )	
	--
	--�ڴ˻�Ҫ�ٴμ��һ��....
	--
	local ret
	ret = x300085_OnConditionCheck( sceneId, selfId )
	if 0 == ret then
		return 0
	end

	return 1

end

--**********************************
--ֻ��ִ��һ����ڣ�
--������˲�����ܻ���������ɺ��������ӿڣ������������Ҹ��������������ʱ�򣩣�������
--����Ҳ����������ɺ��������ӿڣ����ܵ�һ��ʼ�����ĳɹ�ִ��֮�󣩡�
--����1������ɹ�������0������ʧ�ܡ�
--ע�������Ǽ�����Чһ�ε����
--**********************************
function x300085_OnActivateOnce( sceneId, selfId )
	
	--�����е�λ��
	local	bagId	= LuaFnGetBagIndexOfUsedItem( sceneId, selfId )
	if bagId < 0 then
		return 0
	end
	
	CallScriptFunction(x300085_g_event,"OnUseItem",sceneId, selfId, bagId)
	return 1

end

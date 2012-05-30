-- 200056 һ������ 
-- ���������ҵ��ι�

-- һ������

--MisDescBegin
--�ű���
x200056_g_ScriptId = 200056

--�����
x200056_g_MissionId = 45

--ǰ�������
x200056_g_PreMissionId = 44

--Ŀ��NPC
x200056_g_Name	="����"

-- 
x200056_g_Name1 = "����¶"

--�������
x200056_g_MissionKind = 49

--����ȼ�
x200056_g_MissionLevel = 70

--�Ƿ��Ǿ�Ӣ����
x200056_g_IfMissionElite = 0

--������
x200056_g_MissionName="һ������"
--��������
x200056_g_MissionInfo="#{Mis_juqing_0045}"
--����Ŀ��
x200056_g_MissionTarget="#{Mis_juqing_Tar_0045}"		
--�ύʱnpc�Ļ�
x200056_g_MissionComplete="  лл�㣬$N���Һ������Ժ���������Ҹ���������ȥ�ˡ�"		

x200056_g_MoneyBonus=48600
x200056_g_exp=86400

x200056_g_RadioItemBonus={{id=10423016 ,num=1},{id=10423017,num=1},{id=10423018,num=1},{id=10423019,num=1}}

x200056_g_Custom	= { {id="�ѻ�������",num=1} }

--MisDescEnd

--**********************************
--������ں���
--**********************************
function x200056_OnDefaultEvent( sceneId, selfId, targetId )	--����������ִ�д˽ű�
	
	if IsHaveMission(sceneId,selfId,x200056_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x200056_g_Name1  then
			--��Ҫ������ɲſ���
			local misIndex = GetMissionIndexByID(sceneId, selfId, x200056_g_MissionId)--�õ�������20�������е����к�
			if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --����������
				x200056_OnContinue( sceneId, selfId, targetId )
			end
		end
		
	elseif x200056_CheckAccept(sceneId,selfId) > 0 then

		BeginEvent(sceneId)
			AddText(sceneId, x200056_g_MissionName)
			AddText(sceneId, x200056_g_MissionInfo)
			AddText(sceneId,"#{M_MUBIAO}#r")
			AddText(sceneId, x200056_g_MissionTarget)
			AddText(sceneId,"#{M_SHOUHUO}#r")
			AddMoneyBonus( sceneId, x200056_g_MoneyBonus )
			for i, item in x200056_g_RadioItemBonus do
				AddRadioItemBonus( sceneId, item.id, item.num )
			end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x200056_g_ScriptId,x200056_g_MissionId)
	end	
end

--**********************************
--�о��¼�
--**********************************
function x200056_OnEnumerate( sceneId, selfId, targetId )

	if 0 > GetLevel(sceneId, selfId)  then
		return
	end
	
	-- ���ǰ������1û����ɣ��ͷ���
	if IsMissionHaveDone(sceneId, selfId, x200056_g_PreMissionId) <= 0   then
		return
	end
	-- ����������Ѿ���ɣ��ͷ���
	if IsMissionHaveDone(sceneId, selfId, x200056_g_MissionId) > 0 then
   	return
	--���������������
	elseif IsHaveMission(sceneId, selfId, x200056_g_MissionId) > 0 then
		if GetName(sceneId, targetId) == x200056_g_Name1  then
			local misIndex = GetMissionIndexByID(sceneId, selfId, x200056_g_MissionId)--�õ�������20�������е����к�
			if GetMissionParam(sceneId, selfId, misIndex, 0) == 1	then   --����������
				AddNumText(sceneId, x200056_g_ScriptId, x200056_g_MissionName,2,0);
			end
		end
		
	--���������������
  elseif x200056_CheckAccept(sceneId, selfId) > 0 then
		if GetName(sceneId, targetId) == x200056_g_Name then
			AddNumText(sceneId, x200056_g_ScriptId, x200056_g_MissionName,1,-1);
		end
  end
end

--**********************************
-- 
--**********************************
function x200056_OnLockedTarget( sceneId, selfId, targetId )

end

--**********************************
--����������
--**********************************
function x200056_CheckAccept( sceneId, selfId )
	-- ������������ǣ�����ﵽ20�����ϣ����������ǰ������
	if GetLevel(sceneId, selfId) < 20   then
		return 0
	end
	
	if IsMissionHaveDone(sceneId, selfId, x200056_g_PreMissionId ) < 1   then
		return 0
	end
	
	return 1
end

--**********************************
--����
--**********************************
function x200056_OnAccept( sceneId, selfId, targetId )

	-- �������ǲ����Ѿ���ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x200056_g_MissionId) > 0   then
		return
	end

	--������������б�
	local ret = AddMission( sceneId,selfId, x200056_g_MissionId, x200056_g_ScriptId, 0, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	--���������������ĳ�����ź�����λ��
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200056_g_MissionId)--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����

	-- ���������û��Ϳ�ʼ
	if LuaFnGetCopySceneData_Param(sceneId, 8) < 3  then
		LuaFnSetCopySceneData_Param(sceneId, 8, 3)
		LuaFnSetCopySceneData_Param(sceneId, 11, 1)
		LuaFnSetCopySceneData_Param(sceneId, 15, targetId)
	end
	
end

--**********************************
--����
--**********************************
function x200056_OnAbandon( sceneId, selfId )
  --������npc˲�ƻ�ԭ��λ��
  DelMission(sceneId, selfId, x200056_g_MissionId)
  
end

--**********************************
--����
--**********************************
function x200056_OnContinue( sceneId, selfId, targetId )

	BeginEvent(sceneId)
		AddText(sceneId,x200056_g_Name)
		AddText(sceneId,x200056_g_MissionComplete)
		AddText(sceneId,"#{M_MUBIAO}#r")
		AddText(sceneId,x200056_g_MissionTarget)
		AddMoneyBonus( sceneId, x200056_g_MoneyBonus )
		for i, item in x200056_g_RadioItemBonus do
			AddRadioItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	
	DispatchMissionContinueInfo(sceneId, selfId, targetId, x200056_g_ScriptId, x200056_g_MissionId)

end

--**********************************
--����Ƿ�����ύ
--**********************************
function x200056_CheckSubmit( sceneId, selfId )
	
	local misIndex = GetMissionIndexByID(sceneId, selfId, x200056_g_MissionId)
	
	local bComplete = GetMissionParam(sceneId, selfId, misIndex, 0)	
	if bComplete > 0 then
		return 1
	else
		return 0
	end
	
end

--**********************************
--�ύ
--**********************************
function x200056_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
	-- ����ǲ�������������������
	if x200056_CheckSubmit(sceneId, selfId) < 1 then 
		return
	end

	BeginAddItem(sceneId)
	for i, item in x200056_g_RadioItemBonus do
		if item.id == selectRadioId then
			AddItem( sceneId,item.id, item.num )
		end
	end
	ret = EndAddItem(sceneId,selfId)
	--���������
	if ret < 1 then
		--������û�мӳɹ�
		BeginEvent(sceneId)
			strText = "��������,�޷��������"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
		return
	end
	AddItemListToHuman(sceneId,selfId)
	
	--���������
	AddMoney(sceneId,selfId, x200056_g_MoneyBonus );
	LuaFnAddExp( sceneId, selfId, x200056_g_exp)
	
	DelMission( sceneId,selfId, x200056_g_MissionId )
	--���������Ѿ�����ɹ�
	MissionCom( sceneId,selfId, x200056_g_MissionId )
	Msg2Player( sceneId, selfId, "#Y�������һ������", MSG2PLAYER_PARA )

	Msg2Player( sceneId, selfId,"���Ѿ������#GһƷ��#Wϵ������",MSG2PLAYER_PARA )
	local selfGuid = LuaFnObjId2Guid(sceneId, selfId)
	LuaFnSendMailToGUID(sceneId, selfGuid, "���Ѿ������#GһƷ��#Wϵ������")

	-- ���һƷ�þ��飬��10������
	local nPoint = GetHumanJuqingPoint(sceneId, selfId)
	SetHumanJuqingPoint(sceneId, selfId, nPoint+10)
	
	-- ֪ͨ��ң�����������ѭ��������
	-- �����ڿ���ȥAA�ǵ�[bb��cc]�ҵ�DD������DDѭ������
	local strText1 = "#{LOOTMISSION_MAIL_13}"
	LuaFnSendSystemMail(sceneId, GetName(sceneId,selfId), strText1)
	
	BeginEvent(sceneId)
		AddText(sceneId,"#{LOOTMISSION_INFO_06}");
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	
end

function x200056_OnHumanDie(sceneId, selfId)

end

--**********************************
--��ʱ�¼�
--**********************************
function x200056_OnTimer(sceneId,selfId)

end



--������������

--MisDescBegin
--�ű���
x210238_g_ScriptId = 210238

--��������NPC����
x210238_g_Position_X=160.0895
x210238_g_Position_Z=156.9309
x210238_g_SceneID=2
x210238_g_AccomplishNPC_Name="����ʦ"

--�����
x210238_g_MissionId = 718

--Ŀ��NPC
x210238_g_Name	="����ʦ"

--�������
x210238_g_MissionKind = 13

--����ȼ�
x210238_g_MissionLevel = 1

--�Ƿ��Ǿ�Ӣ����
x210238_g_IfMissionElite = 0
x210238_g_IsMissionOkFail = 0		--�����ĵ�0λ
--������
x210238_g_MissionName="ʮ��"
--��������
x210238_g_MissionInfo  = "    �����Ĵ������ϸ������һ�����㣬�;������ǰ���һ������ѧ��ţ����õ���ʦ���ڣ�ǰ;������������"
x210238_g_MissionInfo1 = "    ��������������Ҫ�����飬�����Ȱ���ѧ������á�����������֮�󣬾Ϳ�����һλ��ʦ��ѧϰ�����书���Ժ��Ϊһ����Ӣ�ۣ�����ʿ��"
x210238_g_MissionInfo2 = "    �����ɣ�����ﵽ10����������������ʦ�����Ǽ����ϼһ�����׼��һ�ݺ���������"
--����Ŀ��
x210238_g_MissionTarget="#{MIS_dali_ZTS_002}"		
--δ��������npc�Ի�
x210238_g_ContinueInfo="  ���Ѿ��ﵽ10����"
--�ύʱnpc�Ļ�
x210238_g_MissionComplete="  ̫���ˣ�����Լ��������ˡ�"		


x210238_g_exp=0
x210238_g_ItemBonus={}

x210238_g_Custom	= { {id="�Ѵ�ȼ�",num=10} }--�����ĵ�1λ

--MisDescEnd
--**********************************
--������ں���
--**********************************
function x210238_OnDefaultEvent( sceneId, selfId, targetId )

  --��������ɹ��������
  if (IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 ) then
    return

	elseif( IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0)  then
		--���������������Ϣ
		BeginEvent(sceneId)
			AddText(sceneId, x210238_g_MissionName)
			AddText(sceneId, x210238_g_ContinueInfo)
		EndEvent( )
		local bDone = x210238_CheckSubmit( sceneId, selfId )
		DispatchMissionDemandInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId,bDone)
				
	--���������������
  elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			AddText(sceneId,x210238_g_MissionName)
			AddText(sceneId,x210238_g_MissionInfo)
			AddText(sceneId,x210238_g_MissionInfo1)			
			AddText(sceneId,x210238_g_MissionInfo2)
			
			--AddText(sceneId,"#{M_MUBIAO}")
			--AddText(sceneId,x210238_g_MissionTarget)
			--AddText(sceneId,"#{M_SHOUHUO}")
			--AddMoneyBonus( sceneId, x210238_g_MoneyBonus )
			--for i, item in x210238_g_ItemBonus do
			--	AddItemBonus( sceneId, item.id, item.num )
			--end
		EndEvent( )
		DispatchMissionInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
	end
end

--**********************************
--�о��¼�
--**********************************
function x210238_OnEnumerate( sceneId, selfId, targetId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	--����ѽӴ�����
	elseif IsHaveMission(sceneId,selfId,x210238_g_MissionId) > 0 then
	    
	    local bDone = x210238_CheckSubmit( sceneId, selfId ) 
	    if( 1 == bDone ) then
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 2, -1);
	    else
	        AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	    end	
	    			
	--���������������
	elseif x210238_CheckAccept(sceneId,selfId) > 0 then
		AddNumText(sceneId, x210238_g_ScriptId, x210238_g_MissionName, 1, -1);
	end
end

--**********************************
--����������
--**********************************
function x210238_CheckAccept( sceneId, selfId )

	--Ҫ����ɵ�ǰ������
	--if IsMissionHaveDone(sceneId,selfId,645) <= 0 then
	--	return 0

	--��Ҫ1�����ܽ�
	if GetLevel( sceneId, selfId ) >= x210238_g_MissionLevel then
		return 1
	else
		return 0
	end
end

--**********************************
--����
--**********************************
function x210238_OnAccept( sceneId, selfId )
	--��������ɹ��������
	if IsMissionHaveDone(sceneId,selfId,x210238_g_MissionId) > 0 then
		return 
	end
		
	-- ������������б�
	local ret = AddMission( sceneId,selfId, x210238_g_MissionId, x210238_g_ScriptId, 1, 0, 0 )
	if ret <= 0 then
		Msg2Player(  sceneId, selfId,"#Y���������־�Ѿ�����" , MSG2PLAYER_PARA )
		return
	end
	
	--���������������ĳ�����ź�����λ��
	--local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)--�õ�������20�������е����к�
	--SetMissionByIndex(sceneId,selfId,misIndex,0,0)					--�������кŰ���������ĵ�һλ��0	��һλ�����/ʧ�����

	--Msg2Player(  sceneId, selfId,"#Y��������" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	Msg2Player(  sceneId, selfId,"��������:#Y" .. x210238_g_MissionName, MSG2PLAYER_PARA )
	local misIndex = GetMissionIndexByID(sceneId, selfId, x210238_g_MissionId)--�õ�������20�������е����к�
	SetMissionByIndex(sceneId,selfId,misIndex,1,1)
	
end

--**********************************
--����
--**********************************
function x210238_OnAbandon( sceneId, selfId )
	--ɾ����������б��ж�Ӧ������
	DelMission( sceneId, selfId, x210238_g_MissionId )
end

--**********************************
--����
--**********************************
function x210238_OnContinue( sceneId, selfId, targetId )
	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
		AddText(sceneId,x210238_g_MissionName)
		AddText(sceneId,x210238_g_MissionComplete)

		for i, item in x210238_g_ItemBonus do
			AddItemBonus( sceneId, item.id, item.num )
		end
	EndEvent( )
	DispatchMissionContinueInfo(sceneId,selfId,targetId,x210238_g_ScriptId,x210238_g_MissionId)
end

--**********************************
--����Ƿ�����ύ
--**********************************
function x210238_CheckSubmit( sceneId, selfId )

    local Level = GetLevel( sceneId, selfId )
    
    if( Level < 10 ) then
        return 0
    end

	return 1

end

--**********************************
--�ύ
--**********************************
function x210238_OnSubmit( sceneId, selfId, targetId, selectRadioId )
		-- ��ȫ�Լ��
		-- 1���������ǲ������������
		if IsHaveMission(sceneId,selfId,x210238_g_MissionId) <= 0 then
			return
		end
		
		-- 2����������������
		if x210238_CheckSubmit(sceneId, selfId) <= 0    then
			return
		end
		
		-- ��Ǯ�;���
		

		
		if( x210238_g_exp > 0 ) then
		    LuaFnAddExp( sceneId, selfId, x210238_g_exp)
		end
								
		DelMission( sceneId,selfId, x210238_g_MissionId )
		--���������Ѿ�����ɹ�
		MissionCom( sceneId,selfId, x210238_g_MissionId )
		
		
end

--**********************************
--ɱ����������
--**********************************
function x210238_OnKillObject( sceneId, selfId, objdataId ,objId )

end

--**********************************
--���������¼�
--**********************************
function x210238_OnEnterArea( sceneId, selfId, zoneId )
end

--**********************************
--���߸ı�
--**********************************
function x210238_OnItemChanged( sceneId, selfId, itemdataId )
end








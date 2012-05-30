--Ĭ�Ͻ�������

--�������ܹ�5�����

--MisDescBegin

--�ű���

x805020_g_ScriptId = 805020



--�����

x805020_g_MissionId = 442



--��һ�������ID

x805020_g_MissionIdPre = 441



--Ŀ��NPC

x805020_g_Name	="�����ܹ�"



--������߱��

x805020_g_ItemId = 30101001



--���������������

x805020_g_ItemNeedNum = 1



--�������

x805020_g_MissionKind = 13



--����ȼ�

x805020_g_MissionLevel = 1



--�Ƿ��Ǿ�Ӣ����

x805020_g_IfMissionElite = 0



--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--�����Ƿ��Ѿ����

x805020_g_IsMissionOkFail = 0		--�����ĵ�0λ



--�����Ƕ�̬**************************************************************



--������Ҫ�õ�����Ʒ

x805020_g_DemandItem={{id=30101001,num=1}}		--������1λ



--������

x805020_g_MissionName="��������"

x805020_g_MissionInfo_1="  #R"

x805020_g_MissionInfo_2="#{city0_levelup_0001}"

x805020_g_MissionTarget="�������ܹ�5�����"

x805020_g_MissionContinue="����5���������"

x805020_g_MissionComplete="  �ţ����ò������������Ǯ��"

x805020_g_MoneyBonus=0

x805020_g_SignPost = {x = 109, z = 167, tip = "�����ܹ�"}

x805020_g_ItemBonus={{id=30304001,num=1}}

--MisDescEnd

--**********************************

--������ں���

--**********************************

function x805020_OnDefaultEvent( sceneId, selfId, targetId )

    --����ѽӴ�����

		if IsHaveMission(sceneId,selfId,x805020_g_MissionId) > 0 then

			--���������������Ϣ

			BeginEvent(sceneId)

			AddText(sceneId,x805020_g_MissionName)

			AddText(sceneId,x805020_g_MissionContinue)

			EndEvent( )

			bDone = x805020_CheckSubmit( sceneId, selfId )

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x805020_g_ScriptId,x805020_g_MissionId,bDone)

		--���������������

		elseif x805020_CheckAccept(sceneId,selfId) > 0 then

			--�����������ʱ��ʾ����Ϣ

				local  PlayerName=GetName(sceneId,selfId)	

	            local  PlayerSex=GetSex(sceneId,selfId)

	            if PlayerSex == 0 then

		            PlayerSex = "����"

	            else

		            PlayerSex = "����"

	            end

				BeginEvent(sceneId)

					AddText(sceneId,x805020_g_MissionName)

					AddText(sceneId,x805020_g_MissionInfo_1..PlayerName..PlayerSex..x805020_g_MissionInfo_2)

					AddText(sceneId,"#{M_MUBIAO}")

					AddText(sceneId,x805020_g_MissionTarget)

				EndEvent( )

				DispatchMissionInfo(sceneId,selfId,targetId,x805020_g_ScriptId,x805020_g_MissionId)

		end

end



--**********************************

--�о��¼�

--**********************************

function x805020_OnEnumerate( sceneId, selfId, targetId )

    --����ѽӴ�����
		
    if IsHaveMission(sceneId,selfId,x805020_g_MissionId) > 0 then
 			
    	AddNumText(sceneId,x805020_g_ScriptId,x805020_g_MissionName,1,-1);
	
		--���������������
 		elseif x805020_CheckAccept(sceneId,selfId) > 0 then
 	
			AddNumText(sceneId,x805020_g_ScriptId,x805020_g_MissionName,2,-1);
		
		end

end



--**********************************

--����������

--**********************************

function x805020_CheckAccept( sceneId, selfId )

	--��Ҫ1�����ܽ�

	if GetLevel( sceneId, selfId ) >= 1 then
	
		return 1

	else
		
		return 0

	end

end



--**********************************

--����

--**********************************

function x805020_OnAccept( sceneId, selfId )

	--������������б�
	AddMission( sceneId,selfId, x805020_g_MissionId, x805020_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y����������������",MSG2PLAYER_PARA )

	end

--**********************************
--����
--**********************************

function x805020_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x805020_g_MissionId )
end



--**********************************

--����

--**********************************

function x805020_OnContinue( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ

   BeginEvent(sceneId)

		AddText(sceneId,x805020_g_MissionName)

		AddText(sceneId,x805020_g_MissionComplete)

	 EndEvent( )

   DispatchMissionContinueInfo(sceneId,selfId,targetId,x805020_g_ScriptId,x805020_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x805020_CheckSubmit( sceneId, selfId )

	local	SelfMoney = GetMoney(sceneId, selfId)
	
	if(SelfMoney<50000) then
	
		return 0
		
	end

	return 1

end



--**********************************

--�ύ

--**********************************

function x805020_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x805020_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
			ret = DelMission( sceneId, selfId, x805020_g_MissionId )
			if ret > 0 then
	
				local	SelfMoney = GetMoney(sceneId, selfId)
				CostMoney(sceneId, selfId, 50000)			
				
				--���ӽ�������
				
				CityIncProgress(sceneId, selfId, sceneId, 0)
				
				Msg2Player(  sceneId, selfId,"#Y���������������",MSG2PLAYER_PARA )

			end
			
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x805020_OnKillObject( sceneId, selfId, objdataId )

end



--**********************************

--���������¼�

--**********************************

function x805020_OnEnterZone( sceneId, selfId, zoneId )

end



--**********************************

--���߸ı�

--**********************************

function x805020_OnItemChanged( sceneId, selfId, itemdataId )

end


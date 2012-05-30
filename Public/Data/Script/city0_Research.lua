--Ĭ�Ͻ�������

--�������ܹ�5�����

--MisDescBegin

--�ű���

x805026_g_ScriptId = 805026



--�����

x805026_g_MissionId = 443



--��һ�������ID

x805026_g_MissionIdPre = 441



--Ŀ��NPC

x805026_g_Name	="�����ܹ�"



--������߱��

x805026_g_ItemId = 30101001



--���������������

x805026_g_ItemNeedNum = 1



--�������

x805026_g_MissionKind = 13



--����ȼ�

x805026_g_MissionLevel = 1



--�Ƿ��Ǿ�Ӣ����

x805026_g_IfMissionElite = 0



--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--�����Ƿ��Ѿ����

x805026_g_IsMissionOkFail = 0		--�����ĵ�0λ



--�����Ƕ�̬**************************************************************



--������Ҫ�õ�����Ʒ

x805026_g_DemandItem={{id=30101001,num=1}}		--������1λ



--������

x805026_g_MissionName="�����о�"

x805026_g_MissionInfo_1="  #R"

x805026_g_MissionInfo_2="#{city0_levelup_0001}"

x805026_g_MissionTarget="�������ܹ�5�����"

x805026_g_MissionContinue="����5���������"

x805026_g_MissionComplete="  �ţ����ò������������Ǯ��"

x805026_g_MoneyBonus=0

x805026_g_SignPost = {x = 109, z = 167, tip = "�����ܹ�"}

x805026_g_ItemBonus={{id=30304001,num=1}}

--MisDescEnd

--**********************************

--������ں���

--**********************************

function x805026_OnDefaultEvent( sceneId, selfId, targetId )

    --����ѽӴ�����

		if IsHaveMission(sceneId,selfId,x805026_g_MissionId) > 0 then

			--���������������Ϣ

			BeginEvent(sceneId)

			AddText(sceneId,x805026_g_MissionName)

			AddText(sceneId,x805026_g_MissionContinue)

			EndEvent( )

			bDone = x805026_CheckSubmit( sceneId, selfId )

			DispatchMissionDemandInfo(sceneId,selfId,targetId,x805026_g_ScriptId,x805026_g_MissionId,bDone)

		--���������������

		elseif x805026_CheckAccept(sceneId,selfId) > 0 then

			--�����������ʱ��ʾ����Ϣ

				local  PlayerName=GetName(sceneId,selfId)	

	            local  PlayerSex=GetSex(sceneId,selfId)

	            if PlayerSex == 0 then

		            PlayerSex = "����"

	            else

		            PlayerSex = "����"

	            end

				BeginEvent(sceneId)

					AddText(sceneId,x805026_g_MissionName)

					AddText(sceneId,x805026_g_MissionInfo_1..PlayerName..PlayerSex..x805026_g_MissionInfo_2)

					AddText(sceneId,"#{M_MUBIAO}")

					AddText(sceneId,x805026_g_MissionTarget)

				EndEvent( )

				DispatchMissionInfo(sceneId,selfId,targetId,x805026_g_ScriptId,x805026_g_MissionId)

		end

end



--**********************************

--�о��¼�

--**********************************

function x805026_OnEnumerate( sceneId, selfId, targetId )

    --����ѽӴ�����
		
    if IsHaveMission(sceneId,selfId,x805026_g_MissionId) > 0 then
 			
    	AddNumText(sceneId,x805026_g_ScriptId,x805026_g_MissionName,1,-1);
	
		--���������������
 		elseif x805026_CheckAccept(sceneId,selfId) > 0 then
 	
			AddNumText(sceneId,x805026_g_ScriptId,x805026_g_MissionName,2,-1);
		
		end

end



--**********************************

--����������

--**********************************

function x805026_CheckAccept( sceneId, selfId )

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

function x805026_OnAccept( sceneId, selfId )

	--������������б�
	AddMission( sceneId,selfId, x805026_g_MissionId, x805026_g_ScriptId, 0, 0, 0 )
	Msg2Player(  sceneId, selfId,"#Y�������������о�",MSG2PLAYER_PARA )

	end

--**********************************
--����
--**********************************

function x805026_OnAbandon( sceneId, selfId )

	--ɾ����������б��ж�Ӧ������
  DelMission( sceneId, selfId, x805026_g_MissionId )
end



--**********************************

--����

--**********************************

function x805026_OnContinue( sceneId, selfId, targetId )

	--�ύ����ʱ��˵����Ϣ

   BeginEvent(sceneId)

		AddText(sceneId,x805026_g_MissionName)

		AddText(sceneId,x805026_g_MissionComplete)

	 EndEvent( )

   DispatchMissionContinueInfo(sceneId,selfId,targetId,x805026_g_ScriptId,x805026_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x805026_CheckSubmit( sceneId, selfId )

	local	SelfMoney = GetMoney(sceneId, selfId)
	
	if(SelfMoney<50000) then
	
		return 0
		
	end

	return 1

end



--**********************************

--�ύ

--**********************************

function x805026_OnSubmit( sceneId, selfId, targetId, selectRadioId )

	if x805026_CheckSubmit( sceneId, selfId, selectRadioId ) == 1 then
			ret = DelMission( sceneId, selfId, x805026_g_MissionId )
			if ret > 0 then
	
				local	SelfMoney = GetMoney(sceneId, selfId)
				CostMoney(sceneId, selfId, 50000)			
				
				--�����о�����
				
				CityIncProgress(sceneId, selfId, sceneId, 1)
				
				Msg2Player(  sceneId, selfId,"#Y������������о�",MSG2PLAYER_PARA )

			end
			
	end
	
end



--**********************************

--ɱ����������

--**********************************

function x805026_OnKillObject( sceneId, selfId, objdataId )

end



--**********************************

--���������¼�

--**********************************

function x805026_OnEnterZone( sceneId, selfId, zoneId )

end



--**********************************

--���߸ı�

--**********************************

function x805026_OnItemChanged( sceneId, selfId, itemdataId )

end


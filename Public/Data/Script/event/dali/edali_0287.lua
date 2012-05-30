-- ����������������
-- �ڸ����ɵİ�ʦNPC������һ��ѡ������������ɡ�

x210287_g_ScriptId = 210287

--**********************************
--�о��¼�
--**********************************
function x210287_OnEnumerate( sceneId, selfId, targetId )
	local mp = GetMenPai(sceneId, selfId)
	if mp ~= 9 then 
		AddNumText(sceneId, x210287_g_ScriptId, "������������", 1, 900);
	end
end

function x210287_OnDefaultEvent( sceneId, selfId, targetId )
	if GetNumText()==900  then
		local nNpcmenPai = -1
		-- ���NPC�����������˵�����
		if GetName(sceneId, targetId) == "����"  then
			nNpcmenPai = 0
		elseif GetName(sceneId, targetId) == "ʯ��"  then
			nNpcmenPai = 1
		elseif GetName(sceneId, targetId) == "����"  then
			nNpcmenPai = 2
		elseif GetName(sceneId, targetId) == "�Ż�"  then
			nNpcmenPai = 3
		elseif GetName(sceneId, targetId) == "·����"  then
			nNpcmenPai = 4
		elseif GetName(sceneId, targetId) == "������"  then
			nNpcmenPai = 5
		elseif GetName(sceneId, targetId) == "��̰"  then
			nNpcmenPai = 6
		elseif GetName(sceneId, targetId) == "����˪"  then
			nNpcmenPai = 7
		elseif GetName(sceneId, targetId) == "�̨����"  then
			nNpcmenPai = 8
		end	
		
		--1,�����ʱ�������ж�����Ƿ�Ϊ�����ɵ��ӣ���������򵯳��Ի���ֻ�б��ŵ��Ӳ�������δ�������ɵ���Ҽ��뱾��
		if nNpcmenPai ~= GetMenPai(sceneId, selfId)   then
			BeginEvent(sceneId)
				AddText(sceneId,"  ֻ�б��ŵ��Ӳ�������δ�������ɵ���Ҽ��뱾�š�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		BeginEvent(sceneId)
			AddText(sceneId,"  ���ڸ����������˲źܼ��Ұ���Ϊ���Ҿ����������ŵ����Ƽ�10��δ�������ɵĵ��Ӽ��뱾�ţ��������һ���Ľ�����");
			AddNumText(sceneId, x210287_g_ScriptId, "��Ҫ�������˼�������", 1, 901)
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	
	elseif GetNumText()== 901  then
	
		--һ��ֻ������3��....
		local lastDayTime = GetMissionData(sceneId, selfId, MD_JOINMEIPAI_DAYTIME)
		local curDayTime = GetDayTime()
		if curDayTime > lastDayTime then
			SetMissionData(sceneId, selfId, MD_JOINMEIPAI_DAYTIME, curDayTime )
			SetMissionData(sceneId, selfId, MD_JOINMEIPAI_COUNT, 0 )
		end

		local TodayCount = GetMissionData(sceneId, selfId, MD_JOINMEIPAI_COUNT)
		if TodayCount > 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  �������Ѿ�����̫������ּ��������ˣ���������������������ְɣ�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end

		-- ����������ǲ��Ǻ�һ���˵��������
		--PrintNum(GetTeamSize(sceneId,selfId))
		if GetTeamSize(sceneId,selfId) < 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"  ������Ҫ���������˵������ǰ����");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		if GetTeamSize(sceneId,selfId) > 2  then
			BeginEvent(sceneId)
				AddText(sceneId,"  ����Ҫ�ͱ�������������������ǰ�����ɡ�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		--�ж��Լ��������ˣ��ǲ��Ƿ�������
		if GetNearTeamCount(sceneId,selfId) ~= 2 then
			BeginEvent(sceneId)
				AddText(sceneId,"  ����Ҫ�����Ķ����ڸ�����");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
		if nPlayerId == selfId  then
			nPlayerId = GetNearTeamMember(sceneId,selfId,1)
		end
		
		local tarPosX, tarPosZ = LuaFnGetWorldPos(sceneId, nPlayerId);
		local npcPosX, npcPosZ = LuaFnGetWorldPos(sceneId, targetId);
		local distSqNpcToPlayer = (tarPosX - npcPosX) * (tarPosX - npcPosX) + (tarPosZ - npcPosZ) * (tarPosZ - npcPosZ);
		if distSqNpcToPlayer >= 9 then
			BeginEvent(sceneId)
				AddText(sceneId,"  ����Ҫ�����Ķ����ڸ�����");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
--		-- ���������ֵ���Ϣ��
		if GetMenPai(sceneId,nPlayerId)~=9 or GetLevel(sceneId,nPlayerId)~= 10  then
			BeginEvent(sceneId)
				AddText(sceneId,"  ֻ�еȼ�����10����û�м����������ɵ���ң�����ͨ���������뱾�š�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		end
		
		-- ִ�е�����Ϳ��Ը����ִ򿪶Ի���
		BeginEvent(sceneId)
			local szStr = "  " .. GetName(sceneId,selfId) .. "�Ƽ�������" .. x210287_GetMenPaiName(GetMenPai(sceneId,selfId)) .. "���������Ƿ�Ը����룿"
			AddText(sceneId, szStr)
			AddNumText(sceneId, x210287_g_ScriptId, "Ը�����", 1, 905)
			AddNumText(sceneId, x210287_g_ScriptId, "���ٿ��ǿ���", 1, 906)
		EndEvent(sceneId)
		DispatchEventList(sceneId,nPlayerId,targetId)
		
		BeginEvent(sceneId)
			AddText(sceneId,"  ���Ѿ������ѷ������Ƽ���Ϣ��")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText()== 905  then
		-- ���Լ�����������ɣ��������ˣ��Լ���ǰ�������ɹ��׶�
		x210287_PlayerJoinMenpai(sceneId,selfId,targetId)
		
--		-- �رնԻ���
--		BeginUICommand(sceneId)
--		EndUICommand(sceneId)
--		DispatchUICommand(sceneId,selfId, 1000)
		
	elseif GetNumText()== 906  then
		-- �رնԻ���
		BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 1000)
		
		--���ӳ���ʾ�Ҿܾ�������....
		if GetNearTeamCount(sceneId,selfId) ~= 2 then
			return
		end

		local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
		if nPlayerId == selfId  then
			nPlayerId = GetNearTeamMember(sceneId,selfId,1)
		end

		if LuaFnIsCanDoScriptLogic(sceneId, nPlayerId) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"�Է��ܾ�����������")
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,nPlayerId)
		end

	end
	
end

function x210287_GetMenPaiName(nMenPaiId)
	local szMenPai = ""
	if nMenPaiId == 0 then
		szMenPai = "������"
	elseif nMenPaiId == 1 then
		szMenPai =  "����"
	elseif nMenPaiId == 2 then
		szMenPai =  "ؤ��"
	elseif nMenPaiId == 3 then
		szMenPai =  "�䵱��"
	elseif nMenPaiId == 4 then
		szMenPai =  "������"
	elseif nMenPaiId == 5 then
		szMenPai =  "������"
	elseif nMenPaiId == 6 then
		szMenPai =  "������"
	elseif nMenPaiId == 7 then
		szMenPai =  "��ɽ��"
	elseif nMenPaiId == 8 then
		szMenPai =  "��ң��"
	end	
	
	return szMenPai
end

function x210287_PlayerJoinMenpai(sceneId,selfId,targetId)
	
	-- �ʵ����㰲ȫ�Լ��
	if GetTeamSize(sceneId,selfId) < 2  then
		BeginEvent(sceneId)
			AddText(sceneId,"  ����������Ƽ��˱�����ӡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	if GetTeamSize(sceneId,selfId) > 2  then
		BeginEvent(sceneId)
			AddText(sceneId,"  ����Ҫ��������������������ǰ�����ɡ�");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	--�ж��Լ��������ˣ��ǲ��Ƿ�������
	if GetNearTeamCount(sceneId,selfId) ~= 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"  ����Ƽ��˱���Ҫ�ڸ�����");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return
	end
	
	local nPlayerId = GetNearTeamMember(sceneId,selfId,0)
	if nPlayerId == selfId  then
		nPlayerId = GetNearTeamMember(sceneId,selfId,1)
	end
	
	-- ��֤���Id�ǲ�����Ч
	if LuaFnIsCanDoScriptLogic(sceneId, nPlayerId) == 0  then
		return
	end
	
	local nMenPaiId = GetMenPai(sceneId, nPlayerId)
	
	if nMenPaiId < 0  or nMenPaiId > 8  then
		return
	end
	
	local szMenpai = x210287_GetMenPaiName(nMenPaiId)
	
	-- �ƶ��������ɵĲ���
	if LuaFnGetPropertyBagSpace( sceneId, selfId ) < 2 then
		BeginEvent(sceneId)
			AddText(sceneId,"  ����һ�±�������Ҫ��������λ�ã��һ��н������㣡")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetLevel( sceneId, selfId ) < 10 then
		BeginEvent(sceneId)
			AddText(sceneId,"ʩ�����ǵȵ�10��֮��������ʦѧ�հɣ�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	else
		x210287_g_MenPai = GetMenPai(sceneId, selfId)
		if x210287_g_MenPai == 0 then
			BeginEvent(sceneId)
				AddText(sceneId, "��������ǲΪʦ�ˣ������������ֵ��ӣ�����ʲôʦ�ء�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		--����ֵΪ9��ʾ������
		elseif x210287_g_MenPai==9	then
			
			LuaFnJoinMenpai(sceneId, selfId, targetId, nMenPaiId)

			-- �������ɹ�ϵֵ
			CallScriptFunction( 200099, "InitRelation", sceneId, selfId )

			BeginEvent(sceneId)
  			AddText(sceneId,"���Ѿ�����" .. szMenpai .. "��");
			EndEvent(sceneId)
			DispatchMissionTips(sceneId,selfId)
			
			-- ����ص��ķ�����Ϊ10��
			LuaFnSetXinFaLevel(sceneId,selfId, 1 + nMenPaiId*6, 10)
			LuaFnSetXinFaLevel(sceneId,selfId, 4 + nMenPaiId*6, 10)
			LuaFnSetXinFaLevel(sceneId,selfId, 5 + nMenPaiId*6, 10)
			
			if nMenPaiId == 0  then 		-- ����
	  		if TryRecieveItem( sceneId, selfId, 10124000, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124000).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 160, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_3}" )
			elseif nMenPaiId == 1  then  --����
	  		if TryRecieveItem( sceneId, selfId, 10124001, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124001).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 161, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_2}" )
			elseif nMenPaiId == 2  then  --ؤ��
	  		if TryRecieveItem( sceneId, selfId, 10124002, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124002).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 162, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_6}" )
			elseif nMenPaiId == 3  then		--�䵱��
	  		if TryRecieveItem( sceneId, selfId, 10124004, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124004).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 163, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_9}" )
			elseif nMenPaiId == 4  then  --������
	  		if TryRecieveItem( sceneId, selfId, 10124003, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124003).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 164, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_4}" )
			elseif nMenPaiId == 5  then  --������
	  		if TryRecieveItem( sceneId, selfId, 10124005, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124005).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 165, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_1}" )
			elseif nMenPaiId == 6  then  --������
	  		if TryRecieveItem( sceneId, selfId, 10124008, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124008).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 166, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_5}" )
			elseif nMenPaiId == 7  then  --��ɽ��
	  		if TryRecieveItem( sceneId, selfId, 10124006, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124006).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 167, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_7}" )
			elseif nMenPaiId == 8  then  --��ң��
	  		if TryRecieveItem( sceneId, selfId, 10124007, 1 ) >= 0 then
					str		= "#Y������"..GetItemName( sceneId, 10124007).."��"
					x210287_MsgBox( sceneId, selfId, str )
				end
				LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 168, 0)
				LuaFnSendSystemMail( sceneId, GetName(sceneId,selfId), "#{LevelMail_menpai_8}" )
			end

			--���ɽ����ټ���
			for i=1, 20 do
				TryRecieveItem( sceneId, selfId, 30501001, 1 )
			end
			x210287_MsgBox( sceneId, selfId, "�õ�20ö�����ټ��" )

			if	LuaFnGetSex( sceneId, selfId)==0	then
				LuaFnMsg2Player( sceneId, selfId,"���Ѿ�����" .. szMenpai .. "��",MSG2PLAYER_PARA)
--				CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
			else
				LuaFnMsg2Player( sceneId, selfId,"���Ѿ�����" .. szMenpai .. "��",MSG2PLAYER_PARA)
--				CallScriptFunction( 220900, "OnDefaultEvent",sceneId, selfId, targetId )
			end
			
			--���Ƽ��˽��� JOIN_MENPAI_WELCOME nPlayerId
			local nMenpaiPoint = GetHumanMenpaiPoint(sceneId, nPlayerId)
			SetHumanMenpaiPoint(sceneId, nPlayerId, nMenpaiPoint+20)
			LuaFnMsg2Player(sceneId, nPlayerId,"���������Ƽ����������20ʦ�Ź��׶ȡ�",MSG2PLAYER_PARA)
			
			--���ӽ����Ƽ��Ĵ���....
			local TodayCount = GetMissionData(sceneId, nPlayerId, MD_JOINMEIPAI_COUNT)
			SetMissionData(sceneId, nPlayerId, MD_JOINMEIPAI_COUNT, TodayCount+1 )

			-- ���ɹ���
			local szPlayer1 = GetName(sceneId, selfId)
			local szPlayer2 = GetName(sceneId, nPlayerId)
			local szBroad = "@*;SrvMsg;" .. "tuijian_join_menpai" ..";"..szPlayer1..";"..szPlayer2..";"..szPlayer2
			
			BroadMsgByChatPipe(sceneId, selfId, szBroad, 7)
			
			-- ����������һ���Ի���ʾ
			BeginEvent(sceneId)
				AddText(sceneId, "  ���Ѿ���Ϊ�˱��ɵ��ӡ�")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
		end
	end
	
end

--**********************************
--��Ϣ��ʾ
--**********************************
function x210287_MsgBox( sceneId, selfId, str )
	Msg2Player( sceneId, selfId, str, MSG2PLAYER_PARA )
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

-- �콱NPC
--��ʹž�����by���ľͺ�
x893000_g_scriptId = 893000
x893000_g_duihuan_scriptId = 77

--**********************************
--�¼��������
--**********************************
function x893000_OnDefaultEvent( sceneId, selfId, targetId )
		local	lev	= GetLevel( sceneId, selfId )
		if lev < 10 then
			BeginEvent(sceneId)
	   			AddText( sceneId, "���¸������������С���������" )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		else 
			BeginEvent(sceneId)
		   		--AddText( sceneId, "  #G�����������µ�#Yɨ��ɮ��#G�������˴������ľ�ׯ����#Y���˲�ʮ���������#G������һ��#cFF0000ɨ��ɮ���ټ���#GֻҪ�����������Щ��#W�Ҿʹ�Ӧ�㲢����������ս����Ϊ������ޣ�" )	
		   		--AddText( sceneId, "  ����#cFF0000�� #Y��#cFF0000��#Y��#cFF0000��#Y��#cFF0000��#Y��#cFF0000��#Y��#G�ȿ��Ը��Ҷһ�#Yɨ��ɮ���ᣡ#G��������ٻ���#cFF0000ɨ��ɮ����#Gһֻ������ԭʼ����#cFF0000100000#G�㣬ɨ��ɮ���޿�������#G�������޼��ܣ�" )	
		   		AddText( sceneId, "    �ഫ�������в���ǰ���Ĵ��������ϧ�����л������أ������ܲ�������Σ�ա�����������Ҫȫ�Ӷ�Ա��Я����Ӧ�ȼ�������ͨ��֤����ȫ�������Ҫ��ɲ��������˶��鷽��ǰ��һ̽��" )	
		   		--AddNumText( sceneId, x893000_g_ScriptId, "#e6f00c7�һ�[���µ�һ����]", 4, 10 )
		   		--AddNumText( sceneId, x893000_g_ScriptId, "#cf30768ɨ��ɮ����:[����������]��ȡ", 4, 20 )
		   		AddText( sceneId, "    �Ƿ�#Gȷ�Ͻ��룿" )
				AddNumText( sceneId, x893000_g_ScriptId, "#Rȷ�Ͻ���", 6, 50 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end
end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x893000_OnEventRequest( sceneId, selfId, targetId, eventId )
	--if eventId == x805016_g_duihuan_scriptId then
		--CallScriptFunction( x805016_g_duihuan_scriptId, "OnEventRequest",sceneId, selfId, targetId, GetNumText() )	
		--return
	--end

	if GetNumText() == 210 then
		BeginEvent( sceneId )
   		local n = GetMonsterCount(sceneId)
		if n>170 then
   		strText = "��ǰ��������Ϊ:"..n.."��,��������170���������ֶ�ˢ��,��"
  		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
   		else 
		BeginEvent( sceneId )
		LuaFnCreateMonster(531, 39339, 30, 30, 17, 0, 402030)
                AddText( sceneId, "ˢ�³ɹ���������Һ͹���������Ϊ:"..n.."����" )
           	AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		end


	elseif GetNumText() == 10 then
	    if LuaFnGetAvailableItemCount(sceneId, selfId, 30505099) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505100) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505101) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505102) < 1 or LuaFnGetAvailableItemCount(sceneId, selfId, 30505103) < 1	then
		x893000_MsgBox( sceneId, selfId, "�Բ���,��Ʒ����,���ܶһ���" )	
		return
           else
	       local bDelOk1 = LuaFnDelAvailableItem(sceneId,selfId, 30505099, 1)
	       local bDelOk2 = LuaFnDelAvailableItem(sceneId,selfId, 30505100, 1)
	       local bDelOk3 = LuaFnDelAvailableItem(sceneId,selfId, 30505101, 1)
	       local bDelOk4 = LuaFnDelAvailableItem(sceneId,selfId, 30505102, 1)
	       local bDelOk5 = LuaFnDelAvailableItem(sceneId,selfId, 30505103, 1)

	       if bDelOk1 < 1 or bDelOk2 < 1 or bDelOk3 < 1 or bDelOk4 < 1 or bDelOk5 < 1 then
		x893000_MsgBox( sceneId, selfId, "�Բ���,��Ʒ����,���ܶһ���" )	
		return
	       else
		--����Ҷ��������
		local nBagIndex = TryRecieveItem( sceneId, selfId, 30503060, 1 )
		x893000_MsgBox( sceneId, selfId, "�һ��ɹ���" )	
				
		local message;	
		local randMessage = random(2);
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
	       end
      end

	elseif GetNumText() == 20 then
		BeginEvent( sceneId )
		AddText( sceneId, "  �ռ�#cFF000088#G��#Y�����ҳ#G�ұ���ӵ��#cFF0000ɨ��ɮ����#G�󣬿��Ե���������ȡ#cFF0000ɨ��ɮ����#G���������ƣ�#G��ȡ��#Y��������#cFF0000������#G��ѧϰ���ɣ�" )	
		AddText( sceneId, "  #G[#Y����������������#G]#cFF0000Ⱥ�����ܣ�#W��ѡ���棬#G15��#W��Χ�����#Y6��Ŀ��#Wͬʱ�ܵ�ֱ���˺���#G����#cFF000025%Ѫ��#W��ʹĿ������#cFF0000����״̬��#W����״̬��#Y�޷��ƶ�#W��#Yʹ���κμ��ܣ�#G����#cFF00005#G�룬#W��ȴ#cFF00005���ӣ�" )	
		AddNumText( sceneId, x893000_g_ScriptId, "#cf30768��ȡ[����������]", 5, 40 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 40 then

	petcount = LuaFnGetPetCount(sceneId, selfId) --ȡ����������
	for	i=0,petcount-1 do
		petdataid = LuaFnGetPet_DataID(sceneId, selfId, i) --ȡ�����ޱ��
		if petdataid==427 then
			nThisFound = 1
			break
		end
	end

	if nThisFound == 1 then
	       	local nStoneId0 = 30503026
		       c0 = LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId0)
                          if c0 >=88 then
			         LuaFnDelAvailableItem(sceneId,selfId,30503026,88)--ɾ����Ʒ
		--����Ҷ��������
		local nBagIndex = TryRecieveItem( sceneId, selfId, 30402289, 1 )
		
		BeginEvent(sceneId)
			strText = "�һ��ɹ���"
			AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchEventList( sceneId, selfId, targetId )
		
		local message;	
		local randMessage = random(2);
		
		local szTransferEquip = GetBagItemTransfer(sceneId,selfId, nBagIndex)
		
		if randMessage == 1 then
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		else
			message = format("#I#{_INFOUSR%s}#{JPZB_0610_14}#Y#{_INFOMSG%s}#{JPZB_0610_15}", GetName(sceneId, selfId), szTransferEquip);
		end
		
		BroadMsgByChatPipe(sceneId, selfId, message, 4);
		
		return
                          else
               	        BeginEvent( sceneId ) 
	        	           AddText( sceneId, "#G���������������ң������ϸ���û��������Ʒ��С���ұ���Ŷ��" )
              	           EndEvent( sceneId )
               	        DispatchEventList( sceneId, selfId, targetId )
       	            end
	else
		x893000_NotifyFailTips(sceneId, selfId, "��û��ɨ��ɮ�������������ֻ��ɨ��ɮ����ѧϰ������ɨ��ɮ����������һ���")
	end

		elseif GetNumText() == 50 then
		BeginEvent( sceneId )
		AddNumText( sceneId, x893000_g_ScriptId, "����ͼ�����", 7, 30 )
   		AddNumText( sceneId, x893000_g_ScriptId, "�����м�����", 7, 31 )
		AddNumText( sceneId, x893000_g_ScriptId, "����߼�����", 7, 32 )
		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

          elseif GetNumText() == 32 then
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  ˫�����״̬�£����ܽ��룬лл��");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "�����𾴵���ң��߼���ͼ���һ���˽�ȥ����ȥ������Ӱɣ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
      CallScriptFunction(893009 , "MakeCopyScene", sceneId, selfId)--����
		
          elseif GetNumText() == 31 then
	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  ˫�����״̬�£����ܽ��룬лл��");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "�����𾴵���ң��߼���ͼ���һ���˽�ȥ����ȥ������Ӱɣ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
      CallScriptFunction(893008 , "MakeCopyScene", sceneId, selfId)--����
--	  return
--end


          elseif GetNumText() == 30 then

	if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
		BeginEvent(sceneId)
		AddText(sceneId,"  ˫�����״̬�£����ܽ��룬лл��");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
		return 0
	end
	if LuaFnHasTeam( sceneId, selfId ) > 0 then
		BeginEvent( sceneId )
		AddText( sceneId, "�����𾴵���ң��߼���ͼ���һ���˽�ȥ����ȥ������Ӱɣ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 
	end
      CallScriptFunction(893007 , "MakeCopyScene", sceneId, selfId)--����
    end
end

--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x893000_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x893000_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end
--**********************************
--��Ϣ��ʾ
--**********************************
function x893000_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x893000_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

--����NPC
--ÿ��������ȡԱ
--һ��
x002095_g_ScriptId = 002095


--**********************************
--�¼��������
--**********************************
function x002095_OnDefaultEvent( sceneId, selfId,targetId )
      local 	nam	= LuaFnGetName( sceneId, selfId )
      local	lev	= GetLevel( sceneId, selfId )
	BeginEvent(sceneId)

		AddText(sceneId,"������������С��ķ���㽫�������ô��ȫ���ҵ��ˡ�")
             --AddNumText( sceneId, x002095_g_ScriptId, "#gFF8C00��ȡ�߱�150���ķ�",8,14 )
	if lev >= 120 then
	     --AddNumText( sceneId, x002095_g_ScriptId, "�޸����ɼ��ܼ�150���ķ�",5,8888 )
	end	
             AddNumText( sceneId, x002095_g_ScriptId, "#Y������ȡԪ��",1,501 )
             AddNumText( sceneId, x002095_g_ScriptId, "#Y������ȡ���",2,502 )
             AddNumText( sceneId, x002095_g_ScriptId, "#gFF7F00������ȡ����",3,503 )
             AddNumText( sceneId, x002095_g_ScriptId, "#gFF8C00��Ҫ��149��",4,3333 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#gFF7F00ȫ���Թ⻷",5,100 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#b#cFF0000����������",5,101 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#cFF0000��ȡʦͽ����",5,102 )
	     --AddNumText( sceneId, x002093_g_ScriptId, "#b#cFF0000����������",5,103 )
             --AddNumText( sceneId, x002095_g_scriptId, "#31#gffff00��ȡ12���¼���#31", 6, 4242)
             AddNumText( sceneId, x002095_g_ScriptId, "��Ҫת��",8,5555 )
              --AddNumText( sceneId, x002095_g_ScriptId, "#gFAFAD2����������",6,11 )
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)

end


function x002095_OnEventRequest( sceneId, selfId, targetId, eventId )
local	key	= GetNumText()
         if key  == 501 then
        
                
              -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30160, 0)
              -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5929, 0)
               -- LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5985, 0) 
               --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30134, 0)
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30170, 0) 
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30180, 0) 
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30186, 0) 
                --LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30005, 0)
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  8051, 0)
		--LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId,  8052, 0)
                --BeginEvent(sceneId)
	        --AddText(sceneId,"��ȡ�⻷�ɹ�,ʱ��������Լ�����ȡ")
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
	local getYB=500000;
	   --ZengDian(sceneId,selfId,targetId,1,getYB)
	   YuanBao(sceneId,selfId,targetId,1,getYB)
	   x002095_Tips( sceneId, selfId, "��ϲ�㣬�ɹ���ȡ "..getYB.." Ԫ����" )
	   x002095_CloseMe(sceneId, selfId)
                end
	 if key  == 502 then
   		AddMoney( sceneId, selfId, 5000000 )
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ��ҳɹ����������500��ҡ�лл���������֧�֡�")
		EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
end
	if key == 503 then 
	local getZD=500000;
	   ZengDian(sceneId,selfId,targetId,1,getZD)
	   --YuanBao(sceneId,selfId,targetId,1,getYB)
	   x002095_Tips( sceneId, selfId, "��ϲ�㣬�ɹ���ȡ "..getZD.." Ԫ����" )
	   x002095_CloseMe(sceneId, selfId)
	end
	 if key  == 6666 then
   ZengDian(sceneId,selfId,targetId,1,300000)

		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ����ɹ����������30������㡣лл���������֧�֡�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key  == 11 then
	x002095_Level12(sceneId, selfId, targetId)
end
if key == 18 then

                LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ����������Լ�ǿ�ˡ�лл���������֧�֡�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key  == 4242 then
			BeginAddItem(sceneId)
			AddItem( sceneId,30308044,1)
			AddItem( sceneId,30308042,1)
			AddItem( sceneId,30308033,1)
			AddItem( sceneId,30308032,1)
			AddItem( sceneId,30308031,1)
			AddItem( sceneId,30308030,1)
		        AddItem( sceneId,30308029,1)
		       AddItem( sceneId,30308028,1)
		       AddItem( sceneId,30308034,1)
                       AddItem( sceneId,30308060,1)
                       AddItem( sceneId,30308026,1)
                       AddItem( sceneId,30308027,1)
		       EndAddItem(sceneId,selfId)
		       AddItemListToHuman(sceneId,selfId)
		       BroadMsgByChatPipe(sceneId, selfId, "@*;SrvMsg;DBD:��ȡ�ɹ�", 0)
end
if key == 3333 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4��ȷ����149����" )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4�ǵģ���Ҫ����", 7, 4444 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 4444 then
		x002095_Shengji( sceneId, selfId, targetId )
end
if key == 5555 then
		BeginEvent( sceneId )
		AddText( sceneId, "#gF4F4F4��ȷ��Ҫ������149�أ�" )
		AddNumText(sceneId, x181003_g_scriptId, "#gF4F4F4�ǵģ���Ҫ", 7, 5566 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
end
if key == 5566 then
		x002095_ZhuanSheng( sceneId, selfId, targetId )
end

if key == 12 then

BeginEvent(sceneId)
AddText( sceneId, "�𾴵���ң���ѡ����Ҫ��ȡ�ı�����#Gÿ������һֻ��BOSSΪ4000+���ʵĳ���" )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡBOSS��-���95��Я��",5,50 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡBOSS��-����95��Я��",5,51 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡBOSS��-С��95��Я��",5,52 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡBOSS��-���95��Я��",5,53 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡ��������-95����������",5,54 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡ����-��ѹҰ����",5,55 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡ����-��������",5,56 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡ����-�޵з���è",5,57 )
		AddNumText( sceneId, x002095_g_ScriptId, "��ȡ����-����",5,58 )
EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
end
if key == 50 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9110, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡBOSS���", 4 )
			str= "#Y������#WBOSS����,#GBOSS������ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 51 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9120, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡBOSS���", 4 )
			str= "#Y������#WBOSS����,#GBOSS������ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 52 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9130, 1, 0);
		TryRecieveItem( sceneId, selfId, 30607001, 1 )
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡBOSS���", 4 )
			str= "#Y������#WBOSS����,#GBOSS������ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 53 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 9100, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡBOSS���", 4 )
			str= "#Y������#WBOSS����,#GBOSS������ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 54 then
				local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 22068, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� #B"..nam.."#G�ɹ���ȡ�������95���������档", 4 )
			str= "#Y������#W�������95���������档"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 55 then
				local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
			
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 33810, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ "..nam.."�ɹ���ȡ��Աר�ó衣", 4 )
			str= "#Y������#WG Mר�ó���,#GG M������ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 56 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 3311, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ñ������ꡣ", 4 )
			str= "#Y������#W��������,#G�������꣬���ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 57 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 3832, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡ�޵з���è��", 4 )
			str= "#Y������#W�޵з���,#G�޵з���è�����ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
if key == 58 then
		local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET)
		if index == 1 then
			BeginEvent(sceneId)
			AddText(sceneId, "���Ѿ���ȡ������������������ˡ�#G��Ա������ڽ�����ҽ����Ѫ��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId) 
		return 0
		end
		
		local createPetRet, retGUID_H, retGUID_L = LuaFnCreatePetToHuman(sceneId, selfId, 33829, 1, 0);
		if createPetRet and createPetRet == 1 then
			SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAOPET, 1 )
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡ������", 4 )
			str= "#Y������#W����,#G���������ڽ�����ҽ����Ѫ��"
			BeginEvent( sceneId )
			AddText( sceneId, str )
			EndEvent( sceneId )
			DispatchMissionTips( sceneId, selfId )
		end
	end
	if key == 13 then
		local CurTime = GetHourTime();
		local iTime = GetMissionData( sceneId, selfId, MF_LINGQUYUANBAOEXP );
		if iTime+1 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵Ļ�Ա����1Сʱ��ֻ����ȡһ�ξ��顣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
          for i = 0,300 do
          AddExp(sceneId,selfId,700000)
               end
			
			SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOEXP, CurTime);
			local	nam	= LuaFnGetName( sceneId, selfId )
			BroadMsgByChatPipe( sceneId, selfId, "#gFF7F24��ϲ��� "..nam.."�ɹ���ȡ200���齱����", 4 )
			BeginEvent( sceneId )
				AddText( sceneId, "��ȡ�ɹ������ɹ�����ȡ��200���顣ף����Ϸ��졣" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
		end
	end
	if key == 14 then
		local MemPai=GetMenPai(sceneId, selfId)
		if MemPai ~=9 then
			BeginEvent(sceneId)
				AddText(sceneId, "���Ѿ����������ˣ�������ʲô��")
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			return
		else
		BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���ѡ����Ҫ��ȡ�ķ������ɡ�#Gע�⣬��ȡ�ķ��󣬳����߱��ķ����ķ��ȼ�ȫ������Ϊ100��������ϴ�������ϵ��������Ե�Ϊ0��������Ե�ģ�����ת����Ĳ�Ҫ��ȡ�ķ���#Y�������Ը���" )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,20 )
			AddNumText( sceneId, x002095_g_ScriptId, "��ң",3,21 )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,22 )
			AddNumText( sceneId, x002095_g_ScriptId, "��ɽ",3,23 )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,24 )
			AddNumText( sceneId, x002095_g_ScriptId, "��ü",3,25 )
			AddNumText( sceneId, x002095_g_ScriptId, "�䵱",3,26 )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,27 )
			AddNumText( sceneId, x002095_g_ScriptId, "ؤ��",3,28 )
    			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		end
	end
	if key == 8888 then
		BeginEvent( sceneId )
			AddText( sceneId, "�װ�����ң����ں�����ɵĲ���������ɼ��ܼ��ķ����������������Ƴ����޸����ܣ����޸�������8���ķ���150����ͬʱ���������Ĳ��㣬������б�Ǹ��" )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,8820 )
			AddNumText( sceneId, x002095_g_ScriptId, "��ң",3,8821 )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,8822 )
			AddNumText( sceneId, x002095_g_ScriptId, "��ɽ",3,8823 )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,8824 )
			AddNumText( sceneId, x002095_g_ScriptId, "��ü",3,8825 )
			AddNumText( sceneId, x002095_g_ScriptId, "�䵱",3,8826 )
			AddNumText( sceneId, x002095_g_ScriptId, "����",3,8827 )
			AddNumText( sceneId, x002095_g_ScriptId, "ؤ��",3,8828 )
    			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 20 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,140)
		LuaFnSetXinFaLevel(sceneId,selfId,32,140)
		LuaFnSetXinFaLevel(sceneId,selfId,33,140)
		LuaFnSetXinFaLevel(sceneId,selfId,34,140)
		LuaFnSetXinFaLevel(sceneId,selfId,35,140)
		LuaFnSetXinFaLevel(sceneId,selfId,36,140)
		LuaFnSetXinFaLevel(sceneId,selfId,60,140)
		LuaFnSetXinFaLevel(sceneId,selfId,77,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�����ɡ�", 4 )
		
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 21 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,140)
		LuaFnSetXinFaLevel(sceneId,selfId,50,140)
		LuaFnSetXinFaLevel(sceneId,selfId,51,140)
		LuaFnSetXinFaLevel(sceneId,selfId,52,140)
		LuaFnSetXinFaLevel(sceneId,selfId,53,140)
		LuaFnSetXinFaLevel(sceneId,selfId,54,140)
		LuaFnSetXinFaLevel(sceneId,selfId,63,140)
		LuaFnSetXinFaLevel(sceneId,selfId,80,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G��ң�ɡ�", 4 )
		

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ�������ң�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 22 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,140)
		LuaFnSetXinFaLevel(sceneId,selfId,2,140)
		LuaFnSetXinFaLevel(sceneId,selfId,3,140)
		LuaFnSetXinFaLevel(sceneId,selfId,4,140)
		LuaFnSetXinFaLevel(sceneId,selfId,5,140)
		LuaFnSetXinFaLevel(sceneId,selfId,6,140)
		LuaFnSetXinFaLevel(sceneId,selfId,55,140)
		LuaFnSetXinFaLevel(sceneId,selfId,72,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�����¡�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 23 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,140)
		LuaFnSetXinFaLevel(sceneId,selfId,44,140)
		LuaFnSetXinFaLevel(sceneId,selfId,45,140)
		LuaFnSetXinFaLevel(sceneId,selfId,46,140)
		LuaFnSetXinFaLevel(sceneId,selfId,47,140)
		LuaFnSetXinFaLevel(sceneId,selfId,48,140)
		LuaFnSetXinFaLevel(sceneId,selfId,62,140)
		LuaFnSetXinFaLevel(sceneId,selfId,79,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G��ɽ�ɡ�", 4 )
		
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ�������ɽ�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 24 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,140)
		LuaFnSetXinFaLevel(sceneId,selfId,38,140)
		LuaFnSetXinFaLevel(sceneId,selfId,39,140)
		LuaFnSetXinFaLevel(sceneId,selfId,40,140)
		LuaFnSetXinFaLevel(sceneId,selfId,41,140)
		LuaFnSetXinFaLevel(sceneId,selfId,42,140)
		LuaFnSetXinFaLevel(sceneId,selfId,61,140)
		LuaFnSetXinFaLevel(sceneId,selfId,78,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�����¡�", 4 )

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 25 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,140)
		LuaFnSetXinFaLevel(sceneId,selfId,26,140)
		LuaFnSetXinFaLevel(sceneId,selfId,27,140)
		LuaFnSetXinFaLevel(sceneId,selfId,28,140)
		LuaFnSetXinFaLevel(sceneId,selfId,29,140)
		LuaFnSetXinFaLevel(sceneId,selfId,30,140)
		LuaFnSetXinFaLevel(sceneId,selfId,59,140)
		LuaFnSetXinFaLevel(sceneId,selfId,76,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G��ü�ɡ�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����˶�ü�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 26 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,140)
		LuaFnSetXinFaLevel(sceneId,selfId,20,140)
		LuaFnSetXinFaLevel(sceneId,selfId,21,140)
		LuaFnSetXinFaLevel(sceneId,selfId,22,140)
		LuaFnSetXinFaLevel(sceneId,selfId,23,140)
		LuaFnSetXinFaLevel(sceneId,selfId,24,140)
		LuaFnSetXinFaLevel(sceneId,selfId,58,140)
		LuaFnSetXinFaLevel(sceneId,selfId,75,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�䵱ɽ��", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ������䵱�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 27 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,140)
		LuaFnSetXinFaLevel(sceneId,selfId,8,140)
		LuaFnSetXinFaLevel(sceneId,selfId,9,140)
		LuaFnSetXinFaLevel(sceneId,selfId,10,140)
		LuaFnSetXinFaLevel(sceneId,selfId,11,140)
		LuaFnSetXinFaLevel(sceneId,selfId,12,140)
		LuaFnSetXinFaLevel(sceneId,selfId,56,140)
		LuaFnSetXinFaLevel(sceneId,selfId,73,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G���̡�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ��������̣�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 28 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,140)
		LuaFnSetXinFaLevel(sceneId,selfId,14,140)
		LuaFnSetXinFaLevel(sceneId,selfId,15,140)
		LuaFnSetXinFaLevel(sceneId,selfId,16,140)
		LuaFnSetXinFaLevel(sceneId,selfId,17,140)
		LuaFnSetXinFaLevel(sceneId,selfId,18,140)
		LuaFnSetXinFaLevel(sceneId,selfId,57,140)
		LuaFnSetXinFaLevel(sceneId,selfId,74,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#Gؤ�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ�����ؤ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8820 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,140)
		LuaFnSetXinFaLevel(sceneId,selfId,32,140)
		LuaFnSetXinFaLevel(sceneId,selfId,33,140)
		LuaFnSetXinFaLevel(sceneId,selfId,34,140)
		LuaFnSetXinFaLevel(sceneId,selfId,35,140)
		LuaFnSetXinFaLevel(sceneId,selfId,36,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ��޸������޼��ܼ�150���ķ���ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8821 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,140)
		LuaFnSetXinFaLevel(sceneId,selfId,50,140)
		LuaFnSetXinFaLevel(sceneId,selfId,51,140)
		LuaFnSetXinFaLevel(sceneId,selfId,52,140)
		LuaFnSetXinFaLevel(sceneId,selfId,53,140)
		LuaFnSetXinFaLevel(sceneId,selfId,54,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G��ң�ɡ�", 4 )
		

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ�������ң�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8822 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,140)
		LuaFnSetXinFaLevel(sceneId,selfId,2,140)
		LuaFnSetXinFaLevel(sceneId,selfId,3,140)
		LuaFnSetXinFaLevel(sceneId,selfId,4,140)
		LuaFnSetXinFaLevel(sceneId,selfId,5,140)
		LuaFnSetXinFaLevel(sceneId,selfId,6,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�����¡�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8823 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,140)
		LuaFnSetXinFaLevel(sceneId,selfId,44,140)
		LuaFnSetXinFaLevel(sceneId,selfId,45,140)
		LuaFnSetXinFaLevel(sceneId,selfId,46,140)
		LuaFnSetXinFaLevel(sceneId,selfId,47,140)
		LuaFnSetXinFaLevel(sceneId,selfId,48,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G��ɽ�ɡ�", 4 )
		
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ�������ɽ�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8824 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,140)
		LuaFnSetXinFaLevel(sceneId,selfId,38,140)
		LuaFnSetXinFaLevel(sceneId,selfId,39,140)
		LuaFnSetXinFaLevel(sceneId,selfId,40,140)
		LuaFnSetXinFaLevel(sceneId,selfId,41,140)
		LuaFnSetXinFaLevel(sceneId,selfId,42,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�����¡�", 4 )

		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8825 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,140)
		LuaFnSetXinFaLevel(sceneId,selfId,26,140)
		LuaFnSetXinFaLevel(sceneId,selfId,27,140)
		LuaFnSetXinFaLevel(sceneId,selfId,28,140)
		LuaFnSetXinFaLevel(sceneId,selfId,29,140)
		LuaFnSetXinFaLevel(sceneId,selfId,30,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G��ü�ɡ�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ����˶�ü�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8826 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,140)
		LuaFnSetXinFaLevel(sceneId,selfId,20,140)
		LuaFnSetXinFaLevel(sceneId,selfId,21,140)
		LuaFnSetXinFaLevel(sceneId,selfId,22,140)
		LuaFnSetXinFaLevel(sceneId,selfId,23,140)
		LuaFnSetXinFaLevel(sceneId,selfId,24,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G�䵱ɽ��", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ������䵱�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8827 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,140)
		LuaFnSetXinFaLevel(sceneId,selfId,8,140)
		LuaFnSetXinFaLevel(sceneId,selfId,9,140)
		LuaFnSetXinFaLevel(sceneId,selfId,10,140)
		LuaFnSetXinFaLevel(sceneId,selfId,11,140)
		LuaFnSetXinFaLevel(sceneId,selfId,12,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#G���̡�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ��������̣�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 8828 then
		local day = GetDayTime();
		local lastDay = GetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1);
		if lastDay == day then
			BeginEvent( sceneId )
			AddText( sceneId, "�𾴵���ң���������ȡ���ķ��ˣ�һ��ֻ����ȡһ�Ρ�" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		end
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,140)
		LuaFnSetXinFaLevel(sceneId,selfId,14,140)
		LuaFnSetXinFaLevel(sceneId,selfId,15,140)
		LuaFnSetXinFaLevel(sceneId,selfId,16,140)
		LuaFnSetXinFaLevel(sceneId,selfId,17,140)
		LuaFnSetXinFaLevel(sceneId,selfId,18,140)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 148, 0)
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#B��ϲ��� #Y"..nam.." #B�ɹ���ȡ�˱�150���ķ���������#Gؤ�", 4 )
		SetMissionData(sceneId, selfId, MF_LINGQUYUANBAOMP1, day);
		BeginEvent( sceneId )
			AddText( sceneId, "#G���ɹ���ȡ���ķ����Ҽ�����ؤ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end

	if key == 15 then
                local   	NameM	= GetName( sceneId, ObjIDM )
	AwardShiTuTitle( sceneId, selfId, NameM .. "�ĵ���" )
	DispatchAllTitle( sceneId, selfId )
		LuaFnAwardSpouseTitle( sceneId, selfId, "VIP��Ա" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ�˻�Ա�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	end
	if key == 16 then
		TryRecieveItem( sceneId, selfId, 30900016, 1 )
		Msg2Player( sceneId, selfId, "������500�����һ���߼���ʯ�ϳɷ���", MSG2PLAYER_PARA )
	end

      if key == 181 then

         local  nam= LuaFnGetName( sceneId, selfId )

            local lastDayTime1 = GetMissionData( sceneId, selfId, MF_LINGQUYUANBAOMP2)
	   
            local CurDayTime1 = GetDayTime()

	           if CurDayTime1 > lastDayTime1 then

                  BeginEvent(sceneId)
		   
                             --for i = 0,30 do 

                                    -- TryRecieveItem( sceneId, selfId, 30505107, 1 )

                                 --  end
                         TryRecieveItem( sceneId, selfId, 10113054, 1 )
			TryRecieveItem( sceneId, selfId, 10113054, 1 )
			TryRecieveItem( sceneId, selfId, 10113054, 1 )
                SetMissionData( sceneId, selfId, MF_LINGQUYUANBAOMP2, CurDayTime1 )

                 str = "#cffffcc��ϲVIP��Ա<#c00ff00"..nam.."#cffffcc>��ȡ������ͨ��֤"

                   BroadMsgByChatPipe(sceneId, selfId, str, 4)

		   AddText(sceneId,"��ϲ����ȡ���ͨ��֤2����������������ȡ")

		  EndEvent(sceneId)

		  DispatchEventList(sceneId,selfId,targetId)
                
                                else

		BeginEvent(sceneId)
			AddText(sceneId," ������˼��������Ѿ���ȡ��������,����������");
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	
	    end
	if key  == 19 then
           TryRecieveItem( sceneId, selfId, 10113054, 1 ) 
                BeginEvent(sceneId)
                            
		  AddText(sceneId,"�����Ʒ��ȡ�ɹ�");
		  EndEvent(sceneId)
		  DispatchEventList(sceneId,selfId,targetId)
                  end
	

          end
    
end

--**********************************
--ת������
--**********************************
function x002095_Level12 (sceneId, selfId, targetId)
	if GetExp(sceneId,selfId) < 0  then
		BeginEvent( sceneId )
			LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
						LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			LuaFnAddExp(sceneId,selfId,700000)
			AddText(sceneId,"�������Ұɣ���10��Ӧ�þͽ���������⣡����...")
		EndEvent( sceneId )
	else

		BeginEvent( sceneId )
			AddText(sceneId,"ʧ��,ֻ�д�ֻ�ò��˾������Ҳ���ʹ�ô˹���!!...")
		EndEvent( sceneId )

	end


	DispatchEventList( sceneId, selfId, targetId )

end

function x002095_ZhuanSheng( sceneId, selfId, targetId )
	local zhuanshengTimes = GetMissionData(sceneId, selfId, MD_ZHUANSHENG)
	local ZS = zhuanshengTimes+1
	if zhuanshengTimes > 30 then
		x002095_NotifyTip( sceneId, selfId, "������ת���������� 30 �Ρ�" )
		x002095_MsgBox( sceneId, selfId, targetId, "������ת���������� 30 �Ρ�" )
		return
	end
	local mppoint = GetHumanMenpaiPoint(sceneId, humanObjId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 149 then
		BeginEvent( sceneId )
		AddText( sceneId, "�ȼ����� #G149 #W������ #G149 #W�����������ҡ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end

        SetLevel( sceneId, selfId, 35)
	     --YuanBao(sceneId,selfId,targetId,1,10000)
	      --ZengDian(sceneId,selfId,targetId,1,100000)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 150, 0)
	SetMissionData(sceneId, selfId, MD_ZHUANSHENG, zhuanshengTimes+1 )

	BeginEvent(sceneId)
		AddText(sceneId,"��ϲ�㣬ת���ɹ�!!!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
		AddText( sceneId, "#W��Ŀǰ�ȼ�Ϊ #G35 #W������������������ת������ﵽ #G149 #W�����������ҽ���ת��������ת���������Ե㣬#gff00f0ת����ǧ��Ҫ����ʹ��ϴ�赤���������Ը���" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gFFFF00��ϲ��� ["..nam.."] ����������������˵� ["..ZS.."] ��ת����", 4 )
end

function x002095_Shengji (sceneId, selfId, targetId)
	local	lev	= GetLevel( sceneId, selfId )
	if lev < 10 then
		BeginEvent( sceneId )
		AddText( sceneId, "�ȼ�����#G149#W������#G149#W�����������ҡ�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return -1
	end
	SetLevel( sceneId, selfId, 149)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 147, 0)
	BeginEvent(sceneId)
		AddText(sceneId,"��ϲ�㣬�����ɹ�!!!")
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
	BeginEvent( sceneId )
		AddText( sceneId, "��ϲ��������149��,����϶���װ����ת��Ŷ��" )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
	local	nam	= LuaFnGetName( sceneId, selfId )
	BroadMsgByChatPipe( sceneId, selfId, "#gFFFF00��ϲ���"..nam.."�ɹ�������150��", 4 )
end


--**********************************
-- �Ի�������Ϣ��ʾ
--**********************************
function x002095_NotifyFailBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end
--**********************************
--��Ϣ��ʾ
--**********************************
function x002095_MsgBox( sceneId, selfId, str )	
	BeginEvent( sceneId )
		AddText( sceneId, str )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�Ի���ʾ
--**********************************
function x002095_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)      
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end







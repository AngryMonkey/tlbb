-- �콱NPC

x889062_g_scriptId = 889062
x889062_g_MaxBagSize	= 60
x889062_g_shoptableindex=235
--�������
x889062_g_flag = {

    [80]	= MF_LINGQUYUANBAO80,
    [90]	= MF_LINGQUYUANBAO90,
    [100]	= MF_LINGQUYUANBAO100,
    [110]	= MF_LINGQUYUANBAO110,
    [120]	= MF_LINGQUYUANBAO120,
    
}
x889062_g_Title		={}
x889062_g_Title[1] = "����ʦ��"

--**********************************
--�¼��������
--**********************************
function x889062_OnDefaultEvent( sceneId, selfId, targetId )
	BeginEvent( sceneId )
		strText = "  #R����#c00ff00#b�������ȡ���Գƺš�#W"		
		AddText( sceneId, strText )
	      --AddNumText( sceneId, x889062_g_scriptId, "#gffff00��ȡѸ��ָ��", 1, 870 )
		--AddNumText( sceneId, x889062_g_scriptId, "#gffff00���ڲ�������ȡԪ����#W", 5, 102 )
		--AddNumText( sceneId, x889062_g_scriptId, "#gffff00���ڲ�����������#W", 5, 103 )
		AddNumText( sceneId, x889062_g_scriptId, "#G�����ȡ#Y����ʯ", 5, 1100 )
             AddNumText( sceneId, x889062_g_scriptId, "#G�����ȡ#YԪ��", 5, 106 )
             AddNumText( sceneId, x889062_g_scriptId, "#cffcc00��Ѫ��ŭ#Y����", 5, 860 )
             AddNumText( sceneId, x889062_g_scriptId, "#cff99cc������Ʒ#Y����", 5, 301 )
	      AddNumText( sceneId, x889062_g_ScriptId, "#Gȫ���⻷#Y��ȡ",5,840 )
             AddNumText( sceneId, x889062_g_scriptId, "#b#G��ȡ����#Y�ƺ�", 5, 501 )
             AddNumText( sceneId, x889062_g_scriptId, "#cFF0000��������#Y��Ȥ", 5, 850 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G��Ч�����#gffff00(����10%)",5,800 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G��Ч��֮��#gffff00(����10%)",5,810 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G��Ч��ĸ��#gffff00(����10%)",5,820 )
             AddNumText( sceneId, x889062_g_ScriptId, "#G��Ч��֬ѩ#gffff00(����10%)",5,830 )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x889062_OnEventRequest( sceneId, selfId, targetId, eventId )
	if GetNumText() == 102 then
   		ZengDian(sceneId,selfId,targetId,1,300000)
              --SetMissionFlag( sceneId, selfId, MF_LINGQUZENGDIAN, 1 )
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡԪ���ɹ����������300000Ԫ����лл���������֧�֡�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
 	elseif GetNumText() == 1100 then
	         BeginAddItem(sceneId)
			AddItem( sceneId, 39999999, 1 )
		EndAddItem(sceneId,selfId)
		AddItemListToHuman(sceneId,selfId)
       		BeginEvent(sceneId)
		AddText(sceneId,"#Y��ȡ#G����ʯ#Y�ɹ���лл������ǵ�֧�֡�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 103 then
          for i = 0,100 do
		--BeginEvent(sceneId)
		LuaFnAddExp( sceneId, selfId,60000000)
		--LuaFnSendSpecificImpactToUnit(sceneId,selfId,selfId,selfId,18,1000)
	        --local menpaiPoint = GetHumanMenpaiPoint(sceneId, selfId)
		--SetHumanMenpaiPoint(sceneId, selfId, menpaiPoint+30000 )
		--AddText(sceneId,"��ȡ�Ź��ɹ����������300000�Ź���лл���������֧�֡�")
		--EndEvent(sceneId)
		--DispatchEventList(sceneId,selfId,targetId)
               end

	elseif GetNumText() == 840 then
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5928, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ���ף����Ϸ���֣��������⡣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 301 then

		BeginEvent( sceneId )
			AddText( sceneId, "#Y��ӭʹ�á���������,#cFF0000ʹ�øù��ܺ�,��Ʒ�����Ͳ��ϰ�����������Ʒ����ȫ�����!#Y��ȷ��������Ҫ��Ʒ�Ƿ��Ѵ�ֿ�." )
			AddNumText( sceneId, x889062_g_ScriptId, "#effc9d8#cf30768ȷ���������", 5, 302 )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	elseif GetNumText() == 302 then
		local ClearCount = 0
		for i = 0, x889062_g_MaxBagSize - 1 do
			if LuaFnEraseItem(sceneId, selfId, i) > 0 then
				ClearCount = ClearCount + 1
			end
		end
		x889062_NotifyFailTips(sceneId, selfId, "#Yһ����#effc9d8#cf30768"..ClearCount.."#Y��װ��������")

      elseif GetNumText() == 450 then

			DispatchShopItem( sceneId, selfId,targetId, x889062_g_shoptableindex )
	elseif GetNumText() == 800 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14017, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ���ף����Ϸ���֣��������⡣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 810 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14018, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ���ף����Ϸ���֣��������⡣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 820 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14019, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ���ף����Ϸ���֣��������⡣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

	elseif GetNumText() == 830 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 14020, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ���ף����Ϸ���֣��������⡣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

       elseif GetNumText() == 850 then
             	BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000���ܣ�#Y��ѡ����ϲ������ģ�ͣ����㿴�������ڲ�ͬ��" )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y��ү",7,8501 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y����",7,8502 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y����",7,8503 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y����",7,8504 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Yʥ����",7,8505 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y������",7,8506 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y�ǹ���",7,8507 )
		AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y�ۺ���",7,8508 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#YС����",7,8509 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y����",7,8510 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y������è",7,8511 )
		--AddNumText( sceneId, x889062_g_ScriptId, "#G��������#W--#Y������è",7,8512 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 8501 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4878, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8502 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4867, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8503 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4828, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8504 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5723, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8505 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4863, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8506 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4864, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8507 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4865, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8508 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 4866, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8509 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5710, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8510 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5006, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8511 then
             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5708, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	elseif GetNumText() == 8512 then
              LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 5709, 0)
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"����ɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

      elseif GetNumText() == 860 then
              x889062_Restore_hpmp( sceneId, selfId, targetId )
		LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"���Ƴɹ���ף����Ϸ��졣")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)

      elseif GetNumText() == 870 then
	       if GetItemCount(sceneId, selfId, 39910008) < 10 then
                 TryRecieveItem( sceneId, selfId, 10305007, 10)

		   LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 18, 0)
		   BeginEvent(sceneId)
		   AddText(sceneId,"��ȡ�ɹ���ף����Ϸ��졣")
		   EndEvent(sceneId)
		   DispatchEventList(sceneId,selfId,targetId)
              else
               	BeginEvent( sceneId ) 
					strText = "������Ѿ���ָ����,��Ҫ��ǲ��NPC��!"
					AddText( sceneId, strText )					
				EndEvent( sceneId )
               	DispatchEventList( sceneId, selfId, targetId )
	        end

      elseif GetNumText() == 104 then

             LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 30150, 0)
		BeginEvent(sceneId)
		AddText(sceneId,"��ȡ�⻷�ɹ����������Լ�ǿ�ˡ�лл���������֧�֡�")
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
       elseif GetNumText() == 501 then
             	BeginEvent( sceneId )
		AddText( sceneId, "#cFF0000���ܣ�#Y��ѡ����ϲ���ĸ��Գƺţ����㿴�������ڲ�ͬ��" )
		AddNumText( sceneId, x889062_g_ScriptId, "���-������Ǽ�į#gff00f0(�ƺ�)",7,791 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-�����#gff00f0(�ƺ�)",7,210 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-������å����˭#gff00f0(�ƺ�)",7,211 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-�Ҿ���ţX#gff00f0(�ƺ�)",7,212 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-��������#gff00f0(�ƺ�)",7,15 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-���ȷ���#gff00f0(�ƺ�)",7,17 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-��������#gff00f0(�ƺ�)",7,18 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-��Ҫ����#gff00f0(�ƺ�)",7,19 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-������PK#gff00f0(�ƺ�)",7,201 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-��������#gff00f0(�ƺ�)",7,202 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-���ǻ�������˭˭#gff00f0(�ƺ�)",7,203 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-�����ϴ�#gff00f0(�ƺ�)",7,204 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-��Ů�޵�#gff00f0(�ƺ�)",7,205 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-��Ů�촽#gff00f0(�ƺ�)",7,206 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-����ս��#gff00f0(�ƺ�)",7,207 )
		AddNumText( sceneId, x889062_g_ScriptId, "���-С��ս��#gff00f0(�ƺ�)",7,208 )
    	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 15 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#6��������#6" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ�˳�����ҳƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 16 then
		TryRecieveItem( sceneId, selfId, 30900016, 1 )
		Msg2Player( sceneId, selfId, "������500Ԫ����һ���߼���ʯ�ϳɷ���", MSG2PLAYER_PARA )
	elseif GetNumText() == 17 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#63���ȷ���#63" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ�˿��ȷ��ӳƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText() == 18 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#56�����#56" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ�˴�����ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText() == 19 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "��Ҫ#33��" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ����Ҫ#33��ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 201 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#70������PK#70" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��#70������PK#70�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 202 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#3��������#3" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��#3��������#3�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 203 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#58���ǻ�������˭#58" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��#58���ǻ�������˭#58�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 204 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "�����ϴ�#r#58#58#58#58#58" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��#58������#58�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 205 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#40��Ů�޵�#40" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��#40��Ů�޵�#40�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 206 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "��Ů��#40" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ����Ů��#40�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 206 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "��Ů��#40" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ����Ů��#40�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 207 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "��#93ս��" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ����#93ս�ӳƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
	
	elseif GetNumText()  == 208 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "С#94ս��" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��С#94ս�ӳƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )


	elseif GetNumText()  == 791 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#101#gffff00������Ǽ�į#101" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ�˸���Ĳ�������/�Ǽ�į�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
  
	elseif GetNumText()  == 210 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#122#gffff00�����#122" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ������椳ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText()  == 211 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#118#gffff00������å����˭#101" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ��������å����˭��" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

	elseif GetNumText()  == 212 then
		LuaFnAwardSpouseTitle( sceneId, selfId, "#b#129#gffff00�Ҿ���ţX#129" )
		DispatchAllTitle( sceneId, selfId )
		BeginEvent( sceneId )
			AddText( sceneId, "#G��ϲ�����ɹ���ȡ���Ҿ���ţX�ƺš�" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )

      elseif GetNumText() == 106 then
	BeginEvent( sceneId )
			AddText( sceneId, "#b#Y    �Ҽ����#G����ʯ#Y�������ܣ���ȡ����Ԫ����" )
			EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
             elseif GetNumText() == 107 then
                
-- ǧ�����Ƶ�ID
	       local nStoneId = 30505022
            if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=5 then
                        BeginEvent( sceneId ) 
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,5)
			TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        AddText( sceneId, "��ȡ�ɹ����뵽����NPC�Ķ�����������" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "���Ѽ���5ǧ��������Ʒ�����һ�,129��֮�����û���ʯ���߰ﹱ��NPC��������" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 
          elseif GetNumText() == 108 then
                
-- ǧ�����Ƶ�ID
	       local nStoneId = 30505155
            if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=6 then
                        BeginEvent( sceneId ) 
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,6)
			TryRecieveItem( sceneId, selfId, 30505156, 1 )
                       TryRecieveItem( sceneId, selfId, 30505156, 1 )
                       TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        TryRecieveItem( sceneId, selfId, 30505156, 1 )
                        AddText( sceneId, "��ȡ�ɹ����뵽����NPC�Ķ�����������" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "���Ѽ���6ǧ�쾡ɳ��Ʒ�����һ�5������ʯ,129��֮�����û���ʯ��NPC��������" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 
elseif GetNumText() == 109 then
local cityguildid = GetCityGuildID(sceneId, selfId)
if cityguildid ~=-1 then
AddText( sceneId, "�Բ����㻹û�м������,���Ұ���Ҫ�г���,Ҫ�������İﹱ�㰡" )
		return
	end
	      local    bg = CityGetAttr( sceneId, selfId, GUILD_CONTRIB_POINT )

            if bg >= 50  then
                        BeginEvent( sceneId ) 
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, -100 )
			TryRecieveItem( sceneId, selfId, 30008019, 1 )
                   
                        AddText( sceneId, "��ȡ������ɹ�" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "��ˢ�ﹱ��100����ܽ��жһ�,�뵽100��������һ�" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 

elseif GetNumText() == 110 then
    local cityguildid = GetCityGuildID(sceneId, selfId)
if cityguildid ~=-1 then
AddText( sceneId, "�Բ����㻹û�м������,���Ұ���Ҫ�г���,Ҫ�������İﹱ�㰡" )
		return
	end            


	      local    bg = CityGetAttr( sceneId, selfId, GUILD_CONTRIB_POINT )

              local nStoneId = 30505156
            if LuaFnGetAvailableItemCount(sceneId, selfId, nStoneId)>=10 then
                        BeginEvent( sceneId ) 
			CityChangeAttr( sceneId, selfId, GUILD_CONTRIB_POINT, 10 )
			LuaFnDelAvailableItem(sceneId,selfId,nStoneId,10)
                   
                        AddText( sceneId, "�ɹ��һ�10��ﹱ" )
 
                    EndEvent( sceneId )
              DispatchEventList( sceneId, selfId, targetId )

                    else
                BeginEvent( sceneId ) 
			
	       AddText( sceneId, "��ȷ���������10������ʯ,�����һ�"..cityguildid.."" )
               EndEvent( sceneId )

           DispatchEventList( sceneId, selfId, targetId )
  
               end 


	end	
end
--**********************************
--�Ի���ʾ
--**********************************
function x889062_TalkMsg( sceneId, selfId, targetId, str )	
	BeginEvent(sceneId)
      AddText(sceneId, str)
  EndEvent(sceneId)
  DispatchEventList(sceneId,selfId,targetId)    
end

--**********************************
-- ��Ļ�м���Ϣ��ʾ
--**********************************
function x889062_NotifyFailTips( sceneId, selfId, Tip )
	BeginEvent( sceneId )
		AddText( sceneId, Tip )
	EndEvent( sceneId )
	DispatchMissionTips( sceneId, selfId )
end

--**********************************
--�ָ�Ѫ����
--**********************************
function x889062_Restore_hpmp( sceneId, selfId, targetId )
	RestoreHp( sceneId, selfId )
	RestoreMp( sceneId, selfId )
	RestoreRage( sceneId, selfId )
end
--**********************************
--��ȡԪ��
--**********************************
function x889062_lingquyuanbao( sceneId, selfId, targetId )
  local mylevel = GetLevel( sceneId, selfId )
  if mylevel <  GetNumText() then
  local strText = format("���ĵȼ����������ȼ��ﵽ%d���������Ұɡ�", GetNumText() )
  x889062_TalkMsg( sceneId, selfId, targetId, strText )
  return
  end
  if GetNumText()==80 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO80 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "���Ѿ���ȡ������������������ˡ�" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,50000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO80, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "��ȡԪ���ɹ����������50000Ԫ����лл���������֧�֡�" )
  elseif GetNumText()==90 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO90 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "���Ѿ���ȡ������������������ˡ�" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,100000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO90, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "��ȡԪ���ɹ����������100000Ԫ����лл���������֧�֡�" )
    elseif GetNumText()==100 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO100 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "���Ѿ���ȡ������������������ˡ�" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,150000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO100, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "��ȡԪ���ɹ����������150000Ԫ����лл���������֧�֡�" )
    elseif GetNumText()==110 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO110 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "���Ѿ���ȡ������������������ˡ�" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,200000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO110, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "��ȡԪ���ɹ����������200000Ԫ����лл���������֧�֡�" )
    elseif GetNumText()==120 then
    local index =	GetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO120 )
      if index == 1 then
        x889062_TalkMsg( sceneId, selfId, targetId, "���Ѿ���ȡ������������������ˡ�" )	
        return
      end
    YuanBao(sceneId,selfId,targetId,1,300000)
    SetMissionFlag( sceneId, selfId, MF_LINGQUYUANBAO120, 1 )
    x889062_TalkMsg( sceneId, selfId, targetId, "��ȡԪ���ɹ����������300000Ԫ����лл���������֧�֡�" )
   end
end

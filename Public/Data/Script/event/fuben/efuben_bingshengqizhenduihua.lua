-- �콱NPC
--��ʥ���󸱱�by���ľͺ�
x402081_g_scriptId = 402081
x402081_g_duihuan_scriptId = 77
x402081_g_putong_scriptId = 402080
x402081_g_kunnan_scriptId = 402082

--**********************************
--�¼��������
--**********************************
function x402081_OnDefaultEvent( sceneId, selfId, targetId )
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
		   		AddText( sceneId, "    �������Ź���ս����죬�쳯��ʿ���������ڽ���ս�֣�����֮�����Ѵ������ǰ�ִ��ܱ�������һ�彫Я������������ǹ�֮������֮����Σ�ڵ�Ϧ��" )	
		   		AddText( sceneId, "    ���ܱ������ɹ�����֮���������У�����ı�̼�ʵΪ�㲼��Ŀ��̽�����ɾ��飬ֻ���г�һ���������º��ܱ��������Ӫ����ǰ������֪��һ���ܵ��ɳ����ɾ���ʥ�������֪������ȥ��Ӫ����Σ��������ȴ�ɳɷṦΰҵ��Ϊ��Ϊ����������ǰ�������Ӣ�����ж��ᡣ" )
		   		--AddNumText( sceneId, x402081_g_ScriptId, "#e6f00c7�һ�[���µ�һ����]", 4, 10 )
		   		--AddNumText( sceneId, x402081_g_ScriptId, "#cf30768ɨ��ɮ����:[����������]��ȡ", 4, 20 )
				AddNumText( sceneId, x402081_g_ScriptId, "��Ϯ����ʥ����", 4, 20 )
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
		end

end
--end
--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x402081_OnEventRequest( sceneId, selfId, targetId, eventId )

		if GetNumText() == 20 then
			BeginEvent( sceneId )
   		AddText( sceneId, "    Ӣ�ۼ�Ȼ�н���Ӣ��������ȥ��̽�Ǳ�ʥ���󣬶�Ȼ�����ո�ǿ����ʶ֮ʿ�����ܵ�����¥�������ɹ��߾������۸��ӳ̶�ԶԶ���������ǵ�����" )
  		AddText( sceneId, "    �ܵ�������һ����������������С���Կ�����Ǳ�����С���Ȼ��������������Ҫ��Ӧ��Σ����Ȼ�������Ტ�ۣ�ȴ��֪Ӣ����Ӻδ�����" )
		AddNumText( sceneId, x402081_g_ScriptId, "��Ϯ����ʥ������ͨģʽ��", 10, 1 )
   		AddNumText( sceneId, x402081_g_ScriptId, "��Ϯ����ʥ��������ģʽ��", 10, 2 )
		AddText( sceneId, strText )
		EndEvent(sceneId)
		DispatchEventList(sceneId,selfId,targetId)
	end
	if GetNumText() == 1 then
		CallScriptFunction(402080 , "OnDefaultEvent", sceneId, selfId)--����	
		return
--	end
	elseif GetNumText() == 2 then
      CallScriptFunction(402082 , "OnDefaultEvent", sceneId, selfId)--����
		return
	end
	return
end
--end
--���ӹ���NPC
--������
--��ͨ

x001172_g_ScriptId	= 001172
x001172_g_MsgInfo = { "#{SHGZ_0612_01}",
											"#{SHGZ_0620_01}",
											"#{SHGZ_0620_02}",
											"#{SHGZ_0620_03}",
										}

--**********************************
--�¼��������
--**********************************
function x001172_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent( sceneId )

		local msgidx = random(getn(x001172_g_MsgInfo))
		AddText( sceneId, x001172_g_MsgInfo[msgidx] )	
    AddNumText( sceneId, x001172_g_ScriptId, "ǰ����ɽ", 9, 3426 )

	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end

--**********************************
--�¼��б�ѡ��һ��
--**********************************
function x001172_OnEventRequest( sceneId, selfId, targetId, eventId )

	--˳������
	local	arg	= GetNumText()

  if arg == 3426 then		--��ɽ
		CallScriptFunction( (400900), "TransferFunc", sceneId, selfId, 25, 165, 53, 20 )
		return
	end

end

--**********************************
--�Ի�������Ϣ��ʾ
--**********************************
function x001172_MsgBox( sceneId, selfId, targetId, msg )
	BeginEvent( sceneId )
		AddText( sceneId, msg )
	EndEvent( sceneId )
	DispatchEventList( sceneId, selfId, targetId )
end



-- �ű���
x890062_g_ScriptId	= 890062
x890062_g_ItemId = 39901006

--**********************************
-- �¼��������
--**********************************
function x890062_OnDefaultEvent( sceneId, selfId )
	if GetNumText() == 20 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 5)
		LuaFnSetXinFaLevel(sceneId,selfId,31,150)
		LuaFnSetXinFaLevel(sceneId,selfId,32,150)
		LuaFnSetXinFaLevel(sceneId,selfId,33,150)
		LuaFnSetXinFaLevel(sceneId,selfId,34,150)
		LuaFnSetXinFaLevel(sceneId,selfId,35,150)
		LuaFnSetXinFaLevel(sceneId,selfId,36,150)
		LuaFnSetXinFaLevel(sceneId,selfId,60,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ����ޡ�", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G�������������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 21 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 8)
		LuaFnSetXinFaLevel(sceneId,selfId,49,150)
		LuaFnSetXinFaLevel(sceneId,selfId,50,150)
		LuaFnSetXinFaLevel(sceneId,selfId,51,150)
		LuaFnSetXinFaLevel(sceneId,selfId,52,150)
		LuaFnSetXinFaLevel(sceneId,selfId,53,150)
		LuaFnSetXinFaLevel(sceneId,selfId,54,150)
		LuaFnSetXinFaLevel(sceneId,selfId,63,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ���ң��", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G����������ң�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 22 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 0)
		LuaFnSetXinFaLevel(sceneId,selfId,1,150)
		LuaFnSetXinFaLevel(sceneId,selfId,2,150)
		LuaFnSetXinFaLevel(sceneId,selfId,3,150)
		LuaFnSetXinFaLevel(sceneId,selfId,4,150)
		LuaFnSetXinFaLevel(sceneId,selfId,5,150)
		LuaFnSetXinFaLevel(sceneId,selfId,6,150)
		LuaFnSetXinFaLevel(sceneId,selfId,55,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ����֡�", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G�������������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 23 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 7)
		LuaFnSetXinFaLevel(sceneId,selfId,43,150)
		LuaFnSetXinFaLevel(sceneId,selfId,44,150)
		LuaFnSetXinFaLevel(sceneId,selfId,45,150)
		LuaFnSetXinFaLevel(sceneId,selfId,46,150)
		LuaFnSetXinFaLevel(sceneId,selfId,47,150)
		LuaFnSetXinFaLevel(sceneId,selfId,48,150)
		LuaFnSetXinFaLevel(sceneId,selfId,62,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ���ɽ��", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G����������ɽ�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 24 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 6)
		LuaFnSetXinFaLevel(sceneId,selfId,37,150)
		LuaFnSetXinFaLevel(sceneId,selfId,38,150)
		LuaFnSetXinFaLevel(sceneId,selfId,39,150)
		LuaFnSetXinFaLevel(sceneId,selfId,40,150)
		LuaFnSetXinFaLevel(sceneId,selfId,41,150)
		LuaFnSetXinFaLevel(sceneId,selfId,42,150)
		LuaFnSetXinFaLevel(sceneId,selfId,61,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ�������", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G�������������ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 25 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 4)
		LuaFnSetXinFaLevel(sceneId,selfId,25,150)
		LuaFnSetXinFaLevel(sceneId,selfId,26,150)
		LuaFnSetXinFaLevel(sceneId,selfId,27,150)
		LuaFnSetXinFaLevel(sceneId,selfId,28,150)
		LuaFnSetXinFaLevel(sceneId,selfId,29,150)
		LuaFnSetXinFaLevel(sceneId,selfId,30,150)
		LuaFnSetXinFaLevel(sceneId,selfId,59,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ���ü��", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G�������˶�ü�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 26 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 3)
		LuaFnSetXinFaLevel(sceneId,selfId,19,150)
		LuaFnSetXinFaLevel(sceneId,selfId,20,150)
		LuaFnSetXinFaLevel(sceneId,selfId,21,150)
		LuaFnSetXinFaLevel(sceneId,selfId,22,150)
		LuaFnSetXinFaLevel(sceneId,selfId,23,150)
		LuaFnSetXinFaLevel(sceneId,selfId,24,150)
		LuaFnSetXinFaLevel(sceneId,selfId,58,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ��䵱��", 4 )
		BeginEvent( sceneId )
			AddText( sceneId, "#G���������䵱�ɣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 27 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 1)
		LuaFnSetXinFaLevel(sceneId,selfId,7,150)
		LuaFnSetXinFaLevel(sceneId,selfId,8,150)
		LuaFnSetXinFaLevel(sceneId,selfId,9,150)
		LuaFnSetXinFaLevel(sceneId,selfId,10,150)
		LuaFnSetXinFaLevel(sceneId,selfId,11,150)
		LuaFnSetXinFaLevel(sceneId,selfId,12,150)
		LuaFnSetXinFaLevel(sceneId,selfId,56,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ����̡�", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G�����������̣�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 28 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 2)
		LuaFnSetXinFaLevel(sceneId,selfId,13,150)
		LuaFnSetXinFaLevel(sceneId,selfId,14,150)
		LuaFnSetXinFaLevel(sceneId,selfId,15,150)
		LuaFnSetXinFaLevel(sceneId,selfId,16,150)
		LuaFnSetXinFaLevel(sceneId,selfId,17,150)
		LuaFnSetXinFaLevel(sceneId,selfId,18,150)
		LuaFnSetXinFaLevel(sceneId,selfId,57,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ�ؤ�", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G��������ؤ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
return 0
	end
	if GetNumText() == 29 then
		LuaFnJoinMenpai(sceneId, selfId, targetId, 9)
		LuaFnSetXinFaLevel(sceneId,selfId,64,150)
		LuaFnSetXinFaLevel(sceneId,selfId,65,150)
		LuaFnSetXinFaLevel(sceneId,selfId,66,150)
		LuaFnSetXinFaLevel(sceneId,selfId,67,150)
		LuaFnSetXinFaLevel(sceneId,selfId,68,150)
		LuaFnSetXinFaLevel(sceneId,selfId,69,150)
		LuaFnSetXinFaLevel(sceneId,selfId,70,150)
		LuaFnSetXinFaLevel(sceneId,selfId,71,150)
		LuaFnDelAvailableItem(sceneId,selfId,x890062_g_ItemId,1)	--ɾ����Ʒ
		local	nam	= LuaFnGetName( sceneId, selfId )
		BroadMsgByChatPipe( sceneId, selfId, "#G��ϲ��� "..nam.."�ɹ��������ɡ�Ľ�ݡ�", 4 )
		BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		BeginEvent( sceneId )
			AddText( sceneId, "#G��������Ľ�ݣ�ף����Ϸ��졣" )
		EndEvent( sceneId )
		DispatchEventList( sceneId, selfId, targetId )
		return 0
	end

end

--**********************************
-- 
--**********************************
function x890062_IsSkillLikeScript( sceneId, selfId)
	return 0
end
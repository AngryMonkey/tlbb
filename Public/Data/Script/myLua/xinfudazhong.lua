--����С��
--�Ҹ��Ĵ���
--�㿴�����ң���������������O(��_��)O~ OK���ǿ�ʼ�ɡ�����������
x000177_g_ScriptId	= 000177
--************************************************************************
function x000177_OnDefaultEvent( sceneId, selfId, targetId )
		local lastDayTime = GetMissionData( sceneId, selfId, MD_ZHONGCHUI );
		local CurTime = GetDayTime();
		if CurTime <= lastDayTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�����Ӗ�ÿ��ֻ����ȡһ�Σ���������������" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#Y¡¡������Ԫ��������ף��ӭ���꣡#G12��21��-1��31�գ�#W���ȼ���60�������ÿ����ɵ���������ȡ#cff99ff�����Ӗ�#Wһö�����������������Ϊ�µ�һ��ף�����㽫���������ջ� " )
		  AddNumText( sceneId, x000177_g_ScriptId, "��ȡ�����Ӗ�",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000177_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 2  then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�����ռ䲻�㣬���ڵ��߰�����������λ��" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	 local level = GetLevel( sceneId, selfId )
	 if level < 60 then
		  BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�ȼ�����60���޷���ȡ" )
		  EndEvent( sceneId )
		  DispatchEventList( sceneId, selfId, targetId )
		  return
		else
		  BeginEvent( sceneId ) 
			TryRecieveItem( sceneId, selfId, 30309825, 1)
			AddText( sceneId, "#G��ϲ����һö�����Ӗ���" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W����#c00ffff�����㳡[256,252]#cff99ff�Ҹ��Ĵ���#W����Ŀ���������Ͼ�Ȼ����һö#G���ʵ��Ӗ�#W�������",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
	local CurTime = GetDayTime();
	    SetMissionData(sceneId, selfId, MD_ZHONGCHUI, CurTime);
      end
	  end
	end
end	

--����С��д�ģ����Ƽ���ʵ�ܸ��ӣ����õĶ��Ǿջ�*************************************

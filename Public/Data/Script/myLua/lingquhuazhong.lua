--����С��
--��ȡ������
--�㿴�����ң���������������O(��_��)O~ OK���ǿ�ʼ�ɡ�����������
x000178_g_ScriptId	= 000178
--************************************************************************
function x000178_OnDefaultEvent( sceneId, selfId, targetId )
		local CurTime = GetQuarterTime();
		local iTime = GetMissionData( sceneId, selfId, MD_XIANHUAZHONGZI );
		if iTime+3 >= CurTime then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�ʻ�������ÿ��һСʱ��ȡһ�Σ����һ��������" )
			EndEvent( sceneId )
			DispatchEventList( sceneId, selfId, targetId )
			return
		else
	    BeginEvent( sceneId )
		  AddText( sceneId, "#W�������Ǹ������ĵط����ļ��紺������һ���ֻ�����˵������������á������Ҵ�����һЩ��˹��õ�壬���ϱ������Ӿ�������ߡ�" )
		  AddNumText( sceneId, x000178_g_ScriptId, "�ʻ�������#GÿСʱ��ȡһ��",5,10 )
	    EndEvent( sceneId )
	    DispatchEventList( sceneId, selfId, targetId )
    end
end
--************************************************************************
function x000178_OnEventRequest( sceneId, selfId, targetId, eventId )
	  local	key	= GetNumText()
	  if key == 10 then
	  local FreeSpace = LuaFnGetPropertyBagSpace( sceneId, selfId )
	  if FreeSpace < 4  then
			BeginEvent( sceneId )
			AddText( sceneId, "#cFF0000�����ռ䲻�㣬���ڵ��߰������ĸ���λ��" )
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
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			TryRecieveItem( sceneId, selfId, 30309813,1)
			AddText( sceneId, "#G��ϲ���������ʻ������ӣ�" )
			EndEvent( sceneId )
      DispatchEventList( sceneId, selfId, targetId )
	local playerName = GetName(sceneId,selfId)
	local strText = format("#G#{_INFOUSR%s}#W����#c00ffff����[307,164]#cff99ff����#W��ѯ�����ֻ��ľ��飬���ﾹȻ�������͸�������#G�ʻ������ӣ�",playerName ) 
	BroadMsgByChatPipe(sceneId, selfId, strText, 4)
		local CurTime = GetQuarterTime();
	    SetMissionData(sceneId, selfId, MD_XIANHUAZHONGZI, CurTime);
      end
	  end
	end
end	

--����С��д�ģ����Ƽ���ʵ�ܸ��ӣ����õĶ��Ǿջ�*************************************

--891000

-- �������������ᱦ�ĳ���

--************************************************************************
--MisDescBegin
--�ű���
x891000_g_ScriptId = 891000

--�¼�
x891000_g_Update = {

    ["id01"] = 0,
    ["id02"] = 20,
    ["id03"] = 30,

}

--��ʾ��Ϣ
x891000_g_msg = {

    ["cj"]	= "�μ������ᱦ",
    ["jl"]	= "��ȡ�����ᱦ����",
    ["Mail"]	= "ȷ�Ͻ���",

}

--����,���������Ҫ�ͻ���еĶ�Ӧ
--���е����ݵĵ�0λλ��������ʾ��Ƿ���
x891000_g_nActivityId = 9

-- ������ʵ����Ҫ����������ֱ�Ӱ����е��ˣ�����һ�������Ϳ����� 
x891000_g_SceneID = 410

-- �����ǲ��ǻ����ʱ��ı�־
x891000_g_bHuashaning = 0

x891000_g_bEndTime = 0
x891000_g_bMenpai = ""

x891000_g_WorldGlobal = 21

x891000_g_PlayerKc = {}				-- ÿ�����ɱ�˵���Ŀ
x891000_g_PlayerName = {}			-- ÿ����ҵ�����
x891000_g_PlayerNum = 0				-- �����Ŀ

--[ QUFEI 2007-07-27 15:04 UPDATE ]
x891000_g_PlayerMenpai = {}		-- ÿ����ҵ�����
x891000_g_PlayerId = {}

x891000_g_PreTime = 0


--���������2���ؼ�ˢ�µ�....
x891000_g_MJPosA = {
	{x=135, y=125},{x=141, y=123}
}

--�������ܵ�6���ؼ�ˢ�µ�....
x891000_g_MJPosB = {
	{x=143, y=140, rand=-1},
	{x=153, y=121, rand=-1},
	{x=150, y=110, rand=-1},
	{x=138, y=104, rand=-1},
	{x=125, y=107, rand=-1},
	{x=120, y=111, rand=-1},
	{x=122, y=132, rand=-1},
	{x=131, y=138, rand=-1}
}

--�ؼ���....
x891000_g_MJTblA = {
	5009,5010
}

--�ؼ���....
x891000_g_MJTblB = {
	5004,5005,5006,5007,5008
}

x891000_g_MJNameTbl = {
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����",
	"��ɫ����"
}

--�ؼ��ű�....
x891000_g_MJScript = 001235


--**********************************
--������ں���
--**********************************
function x891000_OnDefaultEvent( sceneId, selfId, targetId )
	
    local	key	= GetNumText()

	if key == x891000_g_Update["id01"] then
		if LuaFnHasTeam( sceneId, selfId ) ~= 0  then
			BeginEvent(sceneId)
				AddText(sceneId,"#B�����ᱦ");
				AddText(sceneId,"  ���뿪����֮���ٱ����μӡ�");
			EndEvent(sceneId)
			DispatchEventList(sceneId,selfId,targetId)
			
			return 0
		end
    
        -- 0������˫�����״̬���ˣ����ܱ���
        if LuaFnGetDRideFlag(sceneId, selfId) ~= 0  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B�����ᱦ");
                AddText(sceneId,"  ˫�����״̬�£����ܱ����μ������ᱦ��");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end

        -- 1,����ȼ�����30
        if GetLevel(sceneId, selfId) < 30  then
            BeginEvent(sceneId)
                AddText(sceneId,"#B�����ᱦ");
                AddText(sceneId,"  �μ������ᱦ����Ҫ30�����ϲ��ܲμӣ�������Ϊ���������ȵ�30��֮���������Ұɡ�");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return 0
        end
      
        -- 3,ʱ���⣬���ܱ�����ʱ�䣬8�㵽8��30��
        local nQuarter = mod(GetQuarterTime(),100);
        if nQuarter < 79 or nQuarter >= 84  then		--����ʱ��7:45-8:00
            BeginEvent(sceneId)
                AddText(sceneId,"#B�����ᱦ");
                AddText(sceneId,"  ���ڲ��ǲμ������ᱦ�Ľ���ʱ�䣬����19��45-20��00���ҽ��롣");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            
            return
        end

        -- 4,�������,ʹ�û��������������������Щ����
        local nMenpai = LuaFnGetMenPai(sceneId, selfId)
        
        if nMenpai == 9   then
            BeginEvent(sceneId)
                AddText(sceneId,"#B�����ᱦ");
                AddText(sceneId,"  �Բ�����û�����ɣ�������ô�쵽30���İ�������");
            EndEvent(sceneId)
            DispatchEventList(sceneId,selfId,targetId)
            return 0
        end
  
        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 200, 0)            
        CallScriptFunction((400900), "TransferFunc",sceneId, selfId, 410, 32, 33)
    end
end


--**********************************
--�о��¼�
--**********************************
function x891000_OnEnumerate( sceneId, selfId, targetId )	
    AddNumText( sceneId, x891000_g_ScriptId, x891000_g_msg["cj"], 6, x891000_g_Update["id01"] )          
    --AddNumText( sceneId, x891000_g_ScriptId, x891000_g_msg["Mail"], 6, x891000_g_Update["id03"] )
    --AddNumText( sceneId, x891000_g_ScriptId, x891000_g_msg["jl"], 6, x891000_g_Update["id02"] )        
   
end

--**********************************
--����������
--**********************************
function x891000_CheckAccept( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x891000_OnAccept( sceneId, selfId, targetId )
	
end

--**********************************
--���ͬ����븱��
--**********************************
function x891000_AcceptEnterCopyScene( sceneId, selfId )
	
end

--**********************************
-- ������ڳ���������
--**********************************
function x891000_OnSceneHumanDie( sceneId, selfId, killerId )
	-- ���������ϵ� "��Ƭ����"��ͳͳɾ��
	local nStoneId = 39910008
	local nStoneCount = GetItemCount(sceneId, selfId, nStoneId)
	
	if nStoneCount >= 1  then
		local ret = DelItem(sceneId, selfId, nStoneId, 1)
		
		-- �ڵ������ɵ����������Ƭ�Ž�ȥ����ֹ����ˢ��ֻ�гɹ�ɾ�����Ŵ�������
		if ret > 0   then
			LuaFnCancelSpecificImpact(sceneId,selfId,33816)
			local x
			local z
			x,z = GetWorldPos(sceneId, selfId)
			
			-- �������ɹ������һ�������
			local nBoxId = DropBoxEnterScene(	x,z,sceneId )
			AddItemToBox(sceneId,nBoxId,QUALITY_CREATE_BY_BOSS, 1, nStoneId)
		end
		
	end
	
end

--**********************************
--���ʰȡ��Ʒ�Ļص�����....
--**********************************
function x891000_OnPlayerPickUpItemInLuoyang( sceneId, selfId, itemId, bagidx )

	--����....
	local playerName = GetName(sceneId, selfId)
	local transfer = GetBagItemTransfer(sceneId,selfId,bagidx)
	local rand = random(3)
	local message
	if rand == 1 then
		message = format("#P�������ڷ�����ӿ��#{_INFOUSR%s}#P�����Լ��Ĳ�иŬ�������ڽ�#{_INFOMSG%s}#P�������С�", playerName, transfer )
	elseif rand == 2 then
		message = format("#P������⡣#{_INFOUSR%s}#P��������������Ⱥ�ۣ��ֽſ��ٵĽ�#{_INFOMSG%s}#P�������к�͵���ת���ȥ��", playerName, transfer )
	else
		message = format("#P��¡¡�����һ��������#{_INFOUSR%s}#P�������������ڰ�#{_INFOMSG%s}#P�õ����У�����Ӣ�۷�ӵ׷ɱ֮��", playerName, transfer )
	end
	BroadMsgByChatPipe(sceneId, selfId, message, 4)
       LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 16114, 0)

	return 1

end

--**********************************
--����
--**********************************
function x891000_OnAbandon( sceneId, selfId )
	
end

--**********************************
--����
--**********************************
function x891000_OnContinue( sceneId, selfId, targetId )
	
end	

--**********************************
--����Ƿ�����ύ
--**********************************
function x891000_CheckSubmit( sceneId, selfId, selectRadioId )
	
end

--**********************************
--�ύ
--**********************************
function x891000_OnSubmit( sceneId, selfId, targetId, selectRadioId )
	
end

--**********************************
--ɱ����������
--**********************************
function x891000_OnKillObject( sceneId, selfId, objdataId, objId )

end

--**********************************
--���������¼�
--**********************************
function x891000_OnScenePlayerEnter( sceneId, playerId )
	
	-- ȥ��BUFF
	LuaFnCancelSpecificImpact(sceneId,selfId,16114)
	
	SetPlayerDefaultReliveInfo( sceneId, playerId, "%50", "%50", "0", 410, 31, 34 )

end

--**********************************
--���߸ı�
--**********************************
function x891000_OnItemChanged( sceneId, selfId, itemdataId )
	
end

--**********************************
--����������ʱ���¼�
--**********************************
function x891000_OnCopySceneTimer( sceneId, nowTime )
	
end

--[ QUFEI 2007-07-27 11:13 UPDATE ]
--�����ᱦ�����¼�
function x891000_OnHuashanJiangli( sceneId, selfId, targetId )
			
end

--**********************************
--�����ᱦ������ʱ���¼�
--**********************************
function x891000_OnHuashanSceneTimer( sceneId, selfId )
	
	-- �������������ǲ�������ң����û�У�ֱ�ӷ���
	local nHumanNum = LuaFnGetCopyScene_HumanCount(sceneId)
	if nHumanNum == 0  then
		return
	end
	
	--��⵱ǰ�ǲ��������ᱦ�Ļʱ�䣬������ǣ��Ͱѳ����ڵ�������Ҷ�T��ȥ
	local bIsTime = 1
	local NeedCreate = 1

	local nQuarter = mod(GetQuarterTime(),100);

	if nQuarter < 79 or nQuarter >= 84  then
		bIsTime = 0
 	end

      if nQuarter >= 79 and nQuarter < 84  then
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1  do
		local nObjId = GetMonsterObjID(sceneId, i)
		local MosDataID = GetMonsterDataID( sceneId, nObjId )
		   if MosDataID == 42195 then
			-- �������������ڴ��ڶ������ʱ ��ˢ�³�1��BOSS���������л��б�˪ӰIDֵ����Ĺ֣���
			   NeedCreate = 0
		   end
	 end
	end

       if NeedCreate == 1
	   local nHumanCount = LuaFnGetCopyScene_HumanCount(sceneId)
	   for j=0, nHumanCount-1  do
		   local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId, j)
		   if LuaFnGetAvailableItemCount(sceneId, nHumanId, 39910008) >= 1   then
			   NeedBox = 0
                 else
	                 LuaFnCreateMonster(sceneId, 42195, 32, 33, 1, 253, 0);
		   end
	   end
	end

	if bIsTime == 1   then
			local nNowTime = LuaFnGetCurrentTime()
			if x891000_g_PreTime == 0    then
				x891000_g_PreTime = nNowTime
				return
			end
			-- 1��ÿ���5���ӣ���Ҫ֪ͨ��ң�ǰ3�������ɣ����͸�ȫ����
			if nNowTime > x891000_g_PreTime+300    then
			
				x891000_g_PreTime = nNowTime
				
				--ˢ���ؼ�....
				x891000_GiveMJ( sceneId )
			end
	end

	-- ��� bIsTime == 0 ,�Ͱ����е����T��ȥ
	if bIsTime == 0   then
			
		local i
		for i=0, nHumanNum-1  do

			local nHumanId = LuaFnGetCopyScene_HumanObjId(sceneId,i)
			if LuaFnIsObjValid( sceneId, nHumanId ) == 1 and LuaFnIsCanDoScriptLogic( sceneId, nHumanId ) == 1 then
			  BeginEvent(sceneId)
			  	AddText(sceneId, "#P�����ᱦ�������")
			  EndEvent()
			  DispatchMissionTips(sceneId, nHumanId)
			       LuaFnCancelSpecificImpact(sceneId,nHumanId,200)
				CallScriptFunction((400900), "TransferFunc",sceneId, nHumanId, 0, 161, 105)
			end
		end --END for i=0, nHumanNum-1  do
	end --END if bIsTime == 0

end

--**********************************
-- ɱ�˼���
--**********************************
function x891000_KillPlayer(sceneId, killerId, diedId)

end

--**********************************
-- ����һ����ҵ�ɱ���б���ȥ
--**********************************
function x891000_AddPlayer(sceneId, Name, PlayerId)
	
end

--**********************************
-- ����һ����ҵ�ɱ���б���ȥ
--**********************************
function x891000_Id2Menpai(nMenpaiId)
	
end

--**********************************
--�Ի�����ʾ
--**********************************
function x891000_MyMsgBox( sceneId, selfId, str )
	BeginEvent(sceneId)    
    AddText(sceneId,str);
    EndEvent(sceneId)
    DispatchMissionTips(sceneId,selfId)	
end

--**********************************
--ˢ���ؼ�
--**********************************
function x891000_GiveMJ( sceneId )

	-- ��ɾ���ɵ��ؼ�....
	local nCount = GetMonsterCount(sceneId)
	for i=0, nCount-1 do
		local nMonsterId = GetMonsterObjID(sceneId, i)
		local szName = GetName(sceneId, nMonsterId)
		for j=1, getn(x891000_g_MJNameTbl)  do
			if szName == x891000_g_MJNameTbl[j]  then
				LuaFnDeleteMonster(sceneId, nMonsterId)
			end
		end
	end

	--��������ˢ��2��....
	for i=1, getn(x891000_g_MJPosA)  do
		local Rand = random(getn(x891000_g_MJTblA))
		LuaFnCreateMonster(sceneId, x891000_g_MJTblA[Rand],
																x891000_g_MJPosA[i].x, x891000_g_MJPosA[i].y,
																3, 0, x891000_g_MJScript )

	end

	--��������ˢ��4��....

		--����Ȩֵ....
	for i=1, getn(x891000_g_MJPosB) do
		x891000_g_MJPosB[i].rand = random(100)
	end

		--ѡ��Ȩֵ����4������ΪͶ���ؼ��ĵ�....
	for i=1, 4 do

		local MaxVal = -1
		local index = 1

		for j=1, getn(x891000_g_MJPosB) do
			if x891000_g_MJPosB[j].rand > MaxVal then
				MaxVal = x891000_g_MJPosB[j].rand
				x891000_g_MJPosB[j].rand = -1
				index = j
			end
		end

		--Ͷ���ؼ�....
		local Rand = random(getn(x891000_g_MJTblB))
		LuaFnCreateMonster(sceneId, x891000_g_MJTblB[Rand],
																x891000_g_MJPosB[index].x, x891000_g_MJPosB[index].y,
																3, 0, x891000_g_MJScript )

	end


end

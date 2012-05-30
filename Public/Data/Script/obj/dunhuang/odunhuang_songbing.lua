--大理NPC
--宋军
--普通

--**********************************
--事件交互入口
--**********************************

function x008007_OnDefaultEvent( sceneId, selfId,targetId )
	BeginEvent(sceneId)
		local nRet = random(5)
		if	nRet <=1	then
			AddText(sceneId,"  三年前，玉门关一战，我们败给了西夏军，丢掉了玉门关。到如今我们已经打了大大小小十几仗，还是没有能够光复玉门关。")
		elseif	nRet <=2	then
			AddText(sceneId,"  前几天，杨司令从西京国子监请来了一个人，据说是玉门关太守曹延惠的弟弟，叫做曹延寿。最近杨司令每天都在和他商量秘密军情。")
		elseif	nRet <=3	then
			AddText(sceneId,"  我听中军官说，不久之前，他在#G三危山#W察看地形时，看到了一位好似天上神仙一般的女子。嗯，好象是在#G[220，100]#W附近。")
		elseif	nRet <=4	then
			AddText(sceneId,"  我听中军官说，不久之前，他在#G折柳峡#W遇到西夏兵，慌不择路，躲进了一个神秘的山洞才得以脱身。嗯，好象是在#G[149，42]#W附近。")
		else
			AddText(sceneId,"  沿着#G折柳峡#W一直走，就能到达#G玉门关#W了，嗯，就在#G[66，91]#W附近。你要小心点，西夏兵是很凶残的，他们杀人都不眨眼啊。")
		end
	EndEvent(sceneId)
	DispatchEventList(sceneId,selfId,targetId)
end


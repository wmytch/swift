
        /list_forum_compact_threads_ajax/1/?pn=1&ps=20&OCN=reply&tid=0&r=0.5302122998383183
        /list_forum_compact_threads_ajax/1/?pn=1&ps=20&OCN=reply&tid=0&r=0.299661794339829
		var target_forum_id=$('#Forum_Id').attr('value');
		var page_num=$('#Page_Num').attr('value');
		var page_size=$('#Page_Size').attr('value');
		var tag_id=$('#Target_Tag_Id').attr('value');
		var ocn=$.cookie('THREAD_LIST_ORDER')

		get_compact_threads_url='/list_forum_compact_threads_ajax/'+target_forum_id+'/?pn='+page_num+'&ps='+page_size+"&OCN="+ocn+"&tid="+tag_id+"&r="+Math.random();



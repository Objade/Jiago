async function replyLoadHandler() {
	const replyDiv = document.getElementById('reply')
	const url = cpath + '/board/reply/' + qboard_idx
	
	// 특정 작업이 끝난 이후 진행을 하고 싶다면...await
	// await는 async 함수 안에서만 가능
	
	await fetch(url)
	.then(resp => resp.json())
	.then(json => {
		const arr = json
		replyDiv.innerHTML = ''
		
		arr.forEach(dto => {
			const html = convertHTMLfromJSON(dto)
			replyDiv.innerHTML += html
		})
	})
	const deleteBtnList = document.querySelectorAll('button.delete')
	deleteBtnList.forEach(btn => btn.onclick = deleteHandler)
	
	const rreplyBtnList = document.querySelectorAll('button.rreply')
	rreplyBtnList.forEach(btn => btn.onclick = rreplyHandler)
}

function rreplyHandler(event) {
	event.preventDefault()
	const form = document.getElementById('replyWriteForm')
	const reply = event.target.parentNode.parentNode.parentNode
	
	document.querySelectorAll('.reply').forEach(reply => reply.classList.remove('selected'))
	reply.classList.add('selected')
	reply.appendChild(form)
	form.querySelector('textarea').focus()
}

function convertHTMLfromJSON(dto) {
	// JSON객체를 받아서
	// HTML 태그형식으로 문자열을 반환해야 한다
	
	const margin = dto.reply_depth * 30
	
	let html = `<div class="reply" idx="${dto.idx}" reply_depth="${dto.reply_depth}" style="margin-left: ${margin}px">`
	html += `		<div class="replyTop">`
	html += `			<div class="left">`
	html += `				<div class="writer">${dto.writer}</div>`
	html += `				<div class="writeDate">${getYMD(dto.writeDate)}</div>`	
	html += `			</div>`
	html += `			<div class="right">`
	html += `				<button class="rreply" ${login_userid == '' ? 'hidden' : ''}>답변</button>`
	html += `				<button class="modify" ${login_userid != dto.writer ? 'hidden' : ''}>수정</button>`
	html += `				<button class="delete" ${login_userid != dto.writer ? 'hidden' : ''}>삭제</button>`
	html += `			</div>`
	html += `		</div>`
	html += `		<pre class="content">${dto.content}</pre>`
	html += `</div>`
	return html
}

function getYMD(date) {			// 1675298767000
	const d = new Date(date)	// js 날짜 객체
	const yyyy = d.getFullYear()	// 4자리 연도
	let mm = d.getMonth() + 1		// 월
	let dd = d.getDate()			// 일
	if(mm < 10) {					// 월이 한자리면
		mm = '0' + mm				// 앞에 0을 붙인다
	}
	if(dd < 10) {					// 일이 한자리면
		dd = '0' + dd				// 앞에 0을 붙인다
	}
	return `${yyyy}-${mm}-${dd}`	// 형식대로 문자열을 반환한다
}

function replyWriteHandler(event) {
	event.preventDefault()
	const content = document.querySelector('#replyWriteForm textarea')
	// 게시글 번호, 작성자, 내용
	const ob = {
		board_idx: board_idx,
		writer: login_userid,
		content: content.value,
		parent_idx: event.target.querySelector('input[name="parent_idx"]').value,
		reply_depth: event.target.querySelector('input[name="reply_depth"]').value,
	}
	const url = cpath + '/board/reply/' + qboard_idx
	const opt = {
		method: 'POST',
		body: JSON.stringify(ob),
		headers: {
			'Content-Type': 'application/json; charset=utf-8'
		}
	}
	fetch(url, opt)
	.then(resp => resp.text())
	.then(text => {
		if(text == 1) {
			alert('작성 성공 !!')
			// replyLoadHandler()	// 댓글 작성 이후, 댓글 목록을 다시 불러온다
			location.reload()
			content.value = ''
		}
	})
}



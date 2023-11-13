const detailedFetch = async (url: string, type: string, body: string) => {
  try {
    const response = await fetch(url, {
      method: type,
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
      },
      redirect: 'follow',
      referrerPolicy: 'no-referrer',
      body: body,
    });

    if (!response.ok) {
      throw new Error(`Network response was not ok: ${response.statusText}`);
    }
    const json = await response.json();
    
    return json
    
  } catch (error) {
    // 네트워크 오류 및 JSON 파싱 오류에 대한 예외 처리
    console.error('Fetch error:', error);
  }
};

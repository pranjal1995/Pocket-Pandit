import React, {useEffect, useState} from 'react'

export default function App(){
  const [pujas, setPujas] = useState([])

  useEffect(()=>{
    fetch('/data/example_pujas.json')
      .then(r=>r.json())
      .then(setPujas)
      .catch(console.error)
  },[])

  return (
    <div style={{fontFamily:'system-ui, Arial', padding:20}}>
      <header>
        <h1 style={{color:'#c85a12'}}>Pocket Pandit — Demo</h1>
      </header>

      <main>
        {pujas.length===0 && <div>Loading pujas…</div>}
        {pujas.map(p=> (
          <article key={p.id} style={{border:'1px solid #eee', padding:12, margin:'8px 0', borderRadius:8}}>
            <div style={{fontWeight:700}}>{p.name.en} {p.premium? '★': ''}</div>
            <div>{p.shortDescription?.en}</div>
            <div style={{marginTop:8}}><strong>Estimated:</strong> {p.estimatedMinutes} minutes</div>
          </article>
        ))}
      </main>
    </div>
  )
}

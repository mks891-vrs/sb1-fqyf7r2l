import { NextResponse } from 'next/server'

export async function POST(req: Request) {
  const { prompt } = await req.json()

  const response = await fetch(
    "https://api-inference.huggingface.co/models/google/gemma-7b",
    {
      headers: { Authorization: `Bearer ${process.env.HUGGING_FACE_API_KEY}` },
      method: "POST",
      body: JSON.stringify({ inputs: prompt }),
    }
  );

  const result = await response.json();
  return NextResponse.json(result);
}

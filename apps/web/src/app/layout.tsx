import type { Metadata } from "next";
import localFont from "next/font/local";
import { Nunito } from "next/font/google";

import "./globals.css";

const pretendard = localFont({
  src: "../static/fonts/PretendardVariable.woff2",
  display: "swap",
  weight: "45 920",
  variable: "--font-pretendard",
});

const nunito = Nunito({
  subsets: ["latin"],
  variable: "--font-nunito",
});

export const metadata: Metadata = {
  title: "Nomadwork.ing | 작업하기 좋은 공간 모음",
  description: "작업하기 좋은 공간 모음",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="kr">
      <body className={`${pretendard.variable} ${nunito.variable} antialiased`}>
        {children}
      </body>
    </html>
  );
}

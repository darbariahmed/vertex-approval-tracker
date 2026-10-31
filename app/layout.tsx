import type { Metadata } from "next";
import "./globals.css";

export const metadata: Metadata = {
  title: "Vertex Approval Tracker",
  description: "Payment and approval tracking for Alpha Education Network campuses",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  );
}

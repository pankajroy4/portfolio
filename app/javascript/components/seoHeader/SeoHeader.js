import React from "react";
import { Helmet } from "react-helmet";
import { useContext } from "react";
import { SiteConfigContext } from "../../containers/Main";

const formatName = (name) =>
  name
    ?.trim()
    ?.split(/(?=[A-Z])/)
    ?.join(" ");
function SeoHeader() {
  const { siteConfig } = useContext(SiteConfigContext);
  const seo = siteConfig?.seo;
  const address = siteConfig?.address;

  const data = {
    "@context": "https://schema.org/",
    "@type": "Person",
    name: formatName(siteConfig?.logoName),
    url: seo?.og?.url,
    email: siteConfig?.sameAs?.find(
      (item) => item.includes("@") && !item.startsWith("http")
    ),
    telephone: "",
    sameAs: siteConfig?.sameAs,
    jobTitle: address?.job_title,
    worksFor: {
      "@type": "Organization",
      name: address?.company_name,
    },
    address: {
      "@type": "PostalAddress",
      addressLocality: address?.locality,
      addressRegion: address?.region,
      addressCountry: address?.country,
      postalCode: address?.postalCode,
      streetAddress: address?.streetAddress,
    },
    hasCredential: siteConfig?.credentials,
  };

  return (
    <Helmet>
      <title>{seo?.title}</title>
      <meta name="description" content={seo?.description} />
      <meta property="og:title" content={seo?.og?.title} />
      <meta property="og:type" content={seo?.og?.type} />
      <meta property="og:url" content={seo?.og?.url} />
      <script type="application/ld+json">{JSON.stringify(data)}</script>
    </Helmet>
  );
}

export default SeoHeader;

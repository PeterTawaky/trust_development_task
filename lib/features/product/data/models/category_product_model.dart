// import 'package:trust_development_task/features/product/domain/category_product_entity.dart';

// class CategoryProductModel extends CategoryProductEntity{
//     final int id;
//     final String nameEn;
//     final String nameAr;
//     final String image;
//     final List<Product> products;

//     CategoryProductModel({
//         required this.id,
//         required this.nameEn,
//         required this.nameAr,
//         required this.image,
//         required this.products,
//     }) : super(categoryImage: image ,categoryTitleAr: nameAr ,categoryTitleEn: nameEn ,products:[] );

// }

// class Product {
//     final int id;
//     final String name;
//     final String slug;
//     final Date dateCreated;
//     final Date dateModified;
//     final Status status;
//     final bool featured;
//     final Visibility catalogVisibility;
//     final String description;
//     final String shortDescription;
//     final String sku;
//     final String globalUniqueId;
//     final String price;
//     final String regularPrice;
//     final String salePrice;
//     final dynamic dateOnSaleFrom;
//     final dynamic dateOnSaleTo;
//     final int totalSales;
//     final TaxStatus taxStatus;
//     final String taxClass;
//     final bool manageStock;
//     final dynamic stockQuantity;
//     final StockStatus stockStatus;
//     final Backorders backorders;
//     final String lowStockAmount;
//     final bool soldIndividually;
//     final String weight;
//     final String length;
//     final String width;
//     final String height;
//     final List<dynamic> upsellIds;
//     final List<dynamic> crossSellIds;
//     final int parentId;
//     final bool reviewsAllowed;
//     final String purchaseNote;
//     final List<dynamic> attributes;
//     final List<dynamic> defaultAttributes;
//     final int menuOrder;
//     final String postPassword;
//     final bool virtual;
//     final bool downloadable;
//     final List<int> categoryIds;
//     final List<dynamic> tagIds;
//     final List<dynamic> brandIds;
//     final int shippingClassId;
//     final List<dynamic> downloads;
//     final String imageId;
//     final List<dynamic> galleryImageIds;
//     final int downloadLimit;
//     final int downloadExpiry;
//     final List<dynamic> ratingCounts;
//     final String averageRating;
//     final int reviewCount;
//     final dynamic cogsValue;
//     final List<MetaDatum> metaData;
//     final String nameEn;
//     final String nameAr;
//     final String descriptionEn;
//     final String descriptionAr;
//     final String image;
//     final int priceTax;
//     final int priceTaxSale;
//     final int points;
//     final bool onSale;
//     final List<int> relatedIds;
//     final ProductType type;
//     final List<int> relatedProducts;

//     Product({
//         required this.id,
//         required this.name,
//         required this.slug,
//         required this.dateCreated,
//         required this.dateModified,
//         required this.status,
//         required this.featured,
//         required this.catalogVisibility,
//         required this.description,
//         required this.shortDescription,
//         required this.sku,
//         required this.globalUniqueId,
//         required this.price,
//         required this.regularPrice,
//         required this.salePrice,
//         required this.dateOnSaleFrom,
//         required this.dateOnSaleTo,
//         required this.totalSales,
//         required this.taxStatus,
//         required this.taxClass,
//         required this.manageStock,
//         required this.stockQuantity,
//         required this.stockStatus,
//         required this.backorders,
//         required this.lowStockAmount,
//         required this.soldIndividually,
//         required this.weight,
//         required this.length,
//         required this.width,
//         required this.height,
//         required this.upsellIds,
//         required this.crossSellIds,
//         required this.parentId,
//         required this.reviewsAllowed,
//         required this.purchaseNote,
//         required this.attributes,
//         required this.defaultAttributes,
//         required this.menuOrder,
//         required this.postPassword,
//         required this.virtual,
//         required this.downloadable,
//         required this.categoryIds,
//         required this.tagIds,
//         required this.brandIds,
//         required this.shippingClassId,
//         required this.downloads,
//         required this.imageId,
//         required this.galleryImageIds,
//         required this.downloadLimit,
//         required this.downloadExpiry,
//         required this.ratingCounts,
//         required this.averageRating,
//         required this.reviewCount,
//         required this.cogsValue,
//         required this.metaData,
//         required this.nameEn,
//         required this.nameAr,
//         required this.descriptionEn,
//         required this.descriptionAr,
//         required this.image,
//         required this.priceTax,
//         required this.priceTaxSale,
//         required this.points,
//         required this.onSale,
//         required this.relatedIds,
//         required this.type,
//         required this.relatedProducts,
//     });

// }

// enum Backorders {
//     NO
// }

// enum Visibility {
//     VISIBLE
// }

// class Date {
//     final DateTime date;
//     final int timezoneType;
//     final Timezone timezone;

//     Date({
//         required this.date,
//         required this.timezoneType,
//         required this.timezone,
//     });

// }

// enum Timezone {
//     AFRICA_CAIRO
// }

// class MetaDatum {
//     final int id;
//     final Key key;
//     final dynamic value;

//     MetaDatum({
//         required this.id,
//         required this.key,
//         required this.value,
//     });

// }

// enum Key {
//     KEY_OFFER_IMAGE,
//     KEY_OFFER_IMAGE_PNG,
//     OFFER_IMAGE,
//     OFFER_IMAGE_PNG,
//     RANK_MATH_CONTENTAI_SCORE,
//     RANK_MATH_INTERNAL_LINKS_PROCESSED,
//     RANK_MATH_PRIMARY_PRODUCT_BRAND,
//     RANK_MATH_PRIMARY_PRODUCT_CAT,
//     RANK_MATH_SEO_SCORE,
//     WC_LOCAL_PICKUP_PLUS_LOCAL_PICKUP_PRODUCT_AVAILABILITY,
//     WOOPT_ACTIONS,
//     WP_OLD_DATE
// }

// class ValueClass {
//     final The1Tf0? the1Tf0;
//     final Cugv? cugv;
//     final Lohb? lohb;
//     final G531? g531;
//     final String? keywords;
//     final String? wordCount;
//     final String? linkCount;
//     final String? headingCount;
//     final String? mediaCount;
//     final The1Tn8? the1Tn8;
//     final The6Irg? the6Irg;
//     final Ybqb? ybqb;
//     final Htdc? htdc;

//     ValueClass({
//         this.the1Tf0,
//         this.cugv,
//         this.lohb,
//         this.g531,
//         this.keywords,
//         this.wordCount,
//         this.linkCount,
//         this.headingCount,
//         this.mediaCount,
//         this.the1Tn8,
//         this.the6Irg,
//         this.ybqb,
//         this.htdc,
//     });

// }

// class Cugv {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final CugvTimer timer;
//     final List<String> roles;

//     Cugv({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class ActionVal {
//     final String value;
//     final Base base;
//     final Visibility visibility;

//     ActionVal({
//         required this.value,
//         required this.base,
//         required this.visibility,
//     });

// }

// enum Base {
//     FA
// }

// class CugvTimer {
//     final Rcm7 the8L4P;

//     CugvTimer({
//         required this.the8L4P,
//     });

// }

// class Rcm7 {
//     final String val;
//     final Rcm7Type type;

//     Rcm7({
//         required this.val,
//         required this.type,
//     });

// }

// enum Rcm7Type {
//     EVERY_DAY
// }

// class G531 {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final G531Timer timer;
//     final List<String> roles;

//     G531({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class G531Timer {
//     final Rcm7 the3Rfl;

//     G531Timer({
//         required this.the3Rfl,
//     });

// }

// class Htdc {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final HtdcTimer timer;
//     final List<String> roles;

//     Htdc({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class HtdcTimer {
//     final Rcm7 the0Cl9;

//     HtdcTimer({
//         required this.the0Cl9,
//     });

// }

// class Lohb {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final LohbTimer timer;
//     final List<String> roles;

//     Lohb({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class LohbTimer {
//     final Rcm7 kxvt;

//     LohbTimer({
//         required this.kxvt,
//     });

// }

// class The1Tf0 {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final The1Tf0Timer timer;
//     final List<String> roles;

//     The1Tf0({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class The1Tf0Timer {
//     final Rcm7 rcm7;

//     The1Tf0Timer({
//         required this.rcm7,
//     });

// }

// class The1Tn8 {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final The1Tn8Timer timer;
//     final List<String> roles;

//     The1Tn8({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class The1Tn8Timer {
//     final Rcm7 the1Eow;

//     The1Tn8Timer({
//         required this.the1Eow,
//     });

// }

// class The6Irg {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final The6IrgTimer timer;
//     final List<String> roles;

//     The6Irg({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class The6IrgTimer {
//     final Rcm7 v42U;

//     The6IrgTimer({
//         required this.v42U,
//     });

// }

// class Ybqb {
//     final String name;
//     final String type;
//     final String action;
//     final ActionVal actionVal;
//     final YbqbTimer timer;
//     final List<String> roles;

//     Ybqb({
//         required this.name,
//         required this.type,
//         required this.action,
//         required this.actionVal,
//         required this.timer,
//         required this.roles,
//     });

// }

// class YbqbTimer {
//     final Rcm7 qqap;

//     YbqbTimer({
//         required this.qqap,
//     });

// }

// enum Status {
//     PUBLISH
// }

// enum StockStatus {
//     INSTOCK
// }

// enum TaxStatus {
//     TAXABLE
// }

// enum ProductType {
//     SIMPLE
// }

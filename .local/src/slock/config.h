/* user and group to drop privileges to */
static const char *user  = "xami";
static const char *group = "users";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#082b02",   /* during input */
	[FAILED] = "#5e0505",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
